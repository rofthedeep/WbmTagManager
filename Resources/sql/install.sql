CREATE TABLE IF NOT EXISTS `wbm_data_layer_modules` ( `id` INT(11) NOT NULL AUTO_INCREMENT , `module` VARCHAR(255) NOT NULL , `variables` LONGTEXT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `wbm_data_layer_properties` ( `id` INT(11) NOT NULL AUTO_INCREMENT , `module` VARCHAR(255) NOT NULL , `parentID` INT(11) NOT NULL DEFAULT '0' , `name` VARCHAR(255) NOT NULL , `value` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

INSERT IGNORE INTO `wbm_data_layer_modules` (`id`, `module`, `variables`) VALUES
  (1, 'frontend_listing_index', NULL),
  (2, 'frontend_detail_index', NULL),
  (3, 'frontend_checkout_cart', NULL),
  (4, 'frontend_checkout_confirm', NULL),
  (5, 'frontend_checkout_finish', NULL),
  (6, 'frontend_checkout_ajaxaddarticlecart', NULL),
  (7, 'frontend_checkout_ajaxdeletearticlecart', NULL);

INSERT IGNORE INTO `wbm_data_layer_properties` (`id`, `module`, `parentID`, `name`, `value`) VALUES
  (1, 'frontend_listing_index', 0, 'ecommerce', ''),
  (2, 'frontend_listing_index', 1, 'currencyCode', 'EUR'),
  (4, 'frontend_listing_index', 1, 'impressions', '$sArticles as $sArticle'),
  (6, 'frontend_listing_index', 4, 'name', '{$sArticle.articleName}'),
  (7, 'frontend_listing_index', 4, 'id', '{$sArticle.ordernumber}'),
  (8, 'frontend_listing_index', 4, 'price', '{$sArticle.price_numeric}'),
  (9, 'frontend_listing_index', 4, 'brand', '{$sArticle.supplierName}'),
  (10, 'frontend_listing_index', 4, 'category', '{$sCategoryContent.name}'),
  (11, 'frontend_listing_index', 4, 'list', 'Category'),
  (12, 'frontend_detail_index', 0, 'ecommerce', ''),
  (13, 'frontend_detail_index', 12, 'detail', ''),
  (14, 'frontend_detail_index', 13, 'actionField', ''),
  (15, 'frontend_detail_index', 14, 'list', '{$sCategoryInfo.name}'),
  (16, 'frontend_detail_index', 13, 'name', '{$sArticle.articleName}'),
  (17, 'frontend_detail_index', 13, 'id', '{$sArticle.ordernumber}'),
  (18, 'frontend_detail_index', 13, 'price', '{$sArticle.price_numeric}'),
  (19, 'frontend_detail_index', 13, 'brand', '{$sArticle.supplierName}'),
  (20, 'frontend_detail_index', 13, 'category', '{$sCategoryInfo.name}'),
  (21, 'frontend_detail_index', 13, 'variant', '{$sArticle.additionaltext}'),
  (23, 'frontend_detail_index', 12, 'currencyCode', 'EUR'),
  (24, 'frontend_checkout_ajaxaddarticlecart', 0, 'event', 'addToCart'),
  (25, 'frontend_checkout_ajaxaddarticlecart', 0, 'ecommerce', ''),
  (26, 'frontend_checkout_ajaxaddarticlecart', 25, 'currencyCode', 'EUR'),
  (27, 'frontend_checkout_ajaxaddarticlecart', 25, 'add', ''),
  (28, 'frontend_checkout_ajaxaddarticlecart', 27, 'products', ''),
  (30, 'frontend_checkout_ajaxaddarticlecart', 28, 'id', '{$smarty.request.sAdd}'),
  (33, 'frontend_checkout_ajaxaddarticlecart', 28, 'quantity', '{$smarty.request.sQuantity}'),
  (34, 'frontend_checkout_ajaxdeletearticlecart', 0, 'event', 'removeFromCart'),
  (35, 'frontend_checkout_ajaxdeletearticlecart', 0, 'ecommerce', ''),
  (36, 'frontend_checkout_ajaxdeletearticlecart', 35, 'remove', ''),
  (37, 'frontend_checkout_ajaxdeletearticlecart', 36, 'products', ''),
  (38, 'frontend_checkout_ajaxdeletearticlecart', 37, 'id', '{$smarty.request.sDelete}'),
  (39, 'frontend_checkout_cart', 0, 'event', 'checkout'),
  (40, 'frontend_checkout_cart', 0, 'ecommerce', ''),
  (41, 'frontend_checkout_cart', 40, 'checkout', ''),
  (42, 'frontend_checkout_cart', 41, 'actionField', ''),
  (43, 'frontend_checkout_cart', 42, 'step', '1'),
  (44, 'frontend_checkout_cart', 41, 'products', '$sBasket.content as $sArticle'),
  (45, 'frontend_checkout_cart', 44, 'name', '{$sArticle.articlename}'),
  (46, 'frontend_checkout_cart', 44, 'id', '{$sArticle.ordernumber}'),
  (47, 'frontend_checkout_cart', 44, 'price', '{$sArticle.priceNumeric}'),
  (48, 'frontend_checkout_cart', 44, 'brand', '{$sArticle.additional_details.supplierName}'),
  (49, 'frontend_checkout_cart', 44, 'quantity', '{$sArticle.quantity}'),
  (50, 'frontend_checkout_confirm', 0, 'event', 'checkout'),
  (51, 'frontend_checkout_confirm', 0, 'ecommerce', ''),
  (52, 'frontend_checkout_confirm', 51, 'checkout', ''),
  (53, 'frontend_checkout_confirm', 52, 'actionField', ''),
  (54, 'frontend_checkout_confirm', 53, 'step', '2'),
  (55, 'frontend_checkout_confirm', 53, 'option', '{$sPayment.description}'),
  (56, 'frontend_checkout_confirm', 52, 'products', '$sBasket.content as $sArticle'),
  (57, 'frontend_checkout_confirm', 56, 'name', '{$sArticle.articlename}'),
  (58, 'frontend_checkout_confirm', 56, 'id', '{$sArticle.ordernumber}'),
  (59, 'frontend_checkout_confirm', 56, 'price', '{$sArticle.priceNumeric}'),
  (60, 'frontend_checkout_confirm', 56, 'brand', '{$sArticle.additional_details.supplierName}'),
  (61, 'frontend_checkout_confirm', 56, 'quantity', '{$sArticle.quantity}'),
  (62, 'frontend_checkout_finish', 0, 'purchase', ''),
  (63, 'frontend_checkout_finish', 62, 'actionField', ''),
  (64, 'frontend_checkout_finish', 63, 'id', '{$sOrderNumber}'),
  (65, 'frontend_checkout_finish', 63, 'revenue', '{$sAmount}'),
  (66, 'frontend_checkout_finish', 63, 'tax', '{$sAmountTax}'),
  (67, 'frontend_checkout_finish', 63, 'shipping', '{$sShippingcosts}'),
  (68, 'frontend_checkout_finish', 62, 'products', '$sBasket.content as $sArticle'),
  (69, 'frontend_checkout_finish', 68, 'name', '{$sArticle.articlename}'),
  (70, 'frontend_checkout_finish', 68, 'id', '{$sArticle.ordernumber}'),
  (71, 'frontend_checkout_finish', 68, 'price', '{$sArticle.priceNumeric}'),
  (72, 'frontend_checkout_finish', 68, 'brand', '{$sArticle.additional_details.supplierName}'),
  (73, 'frontend_checkout_finish', 68, 'quantity', '{$sArticle.quantity}');