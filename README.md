## 概览

* [配置](#配置)
* [开发](#开发)

## 配置

### 注册 Merchant ID
使用 Apple Pay 的前提是必须注册一个 `Merchant ID`

1. 在开发者后台选择 [Merchant IDs 标签](https://developer.apple.com/account/ios/identifiers/merchant/merchantCreate.action) ，设置你的 `Merchant ID`，注册系统会默认添加 `merchant.` 前缀，如下图 </br>
![merchant id](imgs/merchant_id.png)

2. 注册完成后再次选择 [Merchant IDs 标签](https://developer.apple.com/account/ios/identifiers/merchant/merchantList.action)，在列表中点击 `ApplePayDemo`，点击 `Edit`

3. 由于我们是在中国区使用 `Apple Pay`，所以在 `Merchant Settings` 的 `Are you processing your payments outside of the United States?` 选项中勾选 `Yes` </br>
![outside us](imgs/outside_us.png)

4. 继续生成 `CSR`，这一步跟 `APNS` 的 `CSR` 生成步骤是一样的，不再赘述，请大家参考相关资料

### 注册 App ID

1. 在开发者后台选择 [App IDs 标签](https://developer.apple.com/account/ios/identifiers/) 注册 `App ID` 并指定 `Bundle ID`，例如 `com.example.appid`，在 `App Services` 中记得勾选 `Apple Pay` </br>
![App Services](imgs/app_services.png)

2. 注册完成再次选择 [App IDs 标签](https://developer.apple.com/account/ios/identifiers/)，点击刚才所注册的 `App ID`，点击 `Edit` 按钮 </br>
![App ID Settings](imgs/app_id_settings.png)

3. 在 `Apple Pay` 中点击 `Edit`，然后选择你刚才生成的 `Merchant ID` </br>
![configure merchant id](imgs/app_id_configure_merchant_id.png)

## 开发
