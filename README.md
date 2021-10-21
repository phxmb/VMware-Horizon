# VMware-Horizon

Powercli can be installed using the following command:

Install-Module -Name VMware.PowerCLI

https://www.powershellgallery.com/packages/VMware.PowerCLI/

Uninstall_VIB_from_multiple_hosts.ps1 can be used the fix the following issue:

https://kb.vmware.com/s/article/85982

Note: the KB has an error. Remove the i40enu vib rather than the i40en. Especially if using Intel network cards! Also, there is no need to install additional vibs after removal of the i40enu.
