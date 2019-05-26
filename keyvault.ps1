param(
    [string] $resourceGroupName,
    [string] $Location,
    [string] $Password
)
if(!(Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction Ignore )){
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $Location}

New-AzureRmKeyVault `
    -VaultName "ayaz-keyvault" `
    -ResourceGroupName $resourceGroupName `
    -Location $Location `
    -EnabledForTemplateDeployment `
    -EnabledForDeployment

Set-AzureKeyVaultSecret `
    -VaultName "ayaz-keyvault" `
    -Name "certpassword" `
    -SecretValue $(ConvertTo-SecureString -String $Password -AsPlainText -Force) `
    -WarningAction Ignore