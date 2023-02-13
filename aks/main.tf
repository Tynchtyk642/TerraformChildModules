resource "azurerm_kubernetes_cluster" "aks" {
    name                 = local.aks_name
    resource_group_name  = var.rg_name
    location             = var.location
    dns_prefix           = local.aks_dns_prefix

    linux_profile {
      admin_username = var.vm_username
      ssh_key {
        key_data = tls_private_key.linux_vm_ssh.public_key_openssh
      }
    }

    network_profile {
        network_plugin     = "azure"
        load_balancer_sku  = "standard"
        service_cidr       = var.aks_services_cidr
        dns_service_ip     = var.aks_dns_service_ip
        docker_bridge_cidr = var.aks_docker_bridge_cidr
        load_balancer_profile {
            outbound_ip_address_ids = [ azurerm_public_ip.aks.id ]
        }
    }

    default_node_pool {
        name                 = var.aks_default_linux_pool_name
        vm_size              = var.aks_linux_vm_size
        os_disk_size_gb      = var.aks_linux_os_disk_size
        enable_auto_scaling  = true
        availability_zones   = var.aks_linux_node_availability_zones
        max_count            = var.aks_max_linux_count
        min_count            = var.aks_linux_min_node_count
        node_count           = var.aks_linux_node_count
        max_pods             = var.aks_max_pod_count
        type                 = var.aks_linux_vm_type
        vnet_subnet_id       = var.aks_subnet_id
        orchestrator_version = var.aks_kubernetes_version
    }


    auto_scaler_profile {
        balance_similar_node_groups      = true
        max_graceful_termination_sec     = var.aks_max_graceful_termination_sec
        scale_down_delay_after_add       = var.aks_scale_down_delay_after_add
        scale_down_delay_after_failure   = var.aks_scale_down_delay_after_failure
        scan_interval                    = var.aks_scan_interval_for_auto_scaling
        scale_down_unneeded              = var.aks_scale_down_unneeded
        scale_down_unready               = var.aks_scale_down_unready
        scale_down_utilization_threshold = var.aks_scale_down_utilization_threshold
        skip_nodes_with_local_storage    = false #new default in provider is true, set to false for old cluster config
    }

    identity {
      type = "SystemAssigned"
    }

    role_based_access_control {
        enabled = true
    }

    tags = var.tags_list

    addon_profile {
        oms_agent {
            enabled                    = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
        }
        kube_dashboard{
          enabled = false
        }
    }

    lifecycle {
      ignore_changes = [
        default_node_pool.0.orchestrator_version
      ]
    }
    depends_on       = [azurerm_public_ip.aks]

}