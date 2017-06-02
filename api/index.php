<?php

// $dom = new DOMDocument("1.0");
// header("Content-Type: text/xml;charset=utf-8");
// config files

include "../config.php";

$db = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
mysqli_query($db,"SET NAMES 'utf8'");

$m = $_GET['m'];
$limit = $_GET['limit'];



$key=$_REQUEST['key'];
$mType=$_REQUEST['mType'];

$result = mysqli_query($db,"SELECT `value` FROM `oc_setting` WHERE `key`='config_whoapos_api'");
$row= mysqli_fetch_assoc($result);
$api_key = $row['value'];


 if($key!= $api_key )
 {
 	die('invalid param!no value');
 }



if($limit=='')
{
    $limit='100';
}

// Set page
$pagesize = 100;

if ($_GET['page'] == '') {
    $page ='0';
}
else
{
    $page = $_GET['page'] * $pagesize;
}

//$mType=='mOrderSearch'
if($mType=='ProductList')
{
    $data = array();

    //

    $result = mysqli_query($db,"select p.product_id,p.image,p.model,p.tax_class_id, pd.name, od.name Option_Name, m.name Brand,ov.option_value_id Option_id, ov.quantity Option_quantity, ov.upc Option_UPC, p.upc, p.price, p.weight, p.status,p.quantity from oc_product p LEFT JOIN oc_manufacturer m ON p.manufacturer_id=m.manufacturer_id LEFT JOIN oc_product_description pd ON p.product_id=pd.product_id LEFT JOIN oc_product_option_value ov ON p.product_id=ov.product_id LEFT JOIN oc_option_value_description od ON ov.option_value_id=od.option_value_id order by p.product_id ASC limit $page,$pagesize");

    while ($row= mysqli_fetch_assoc($result))
    {
        
        $aa[]=$row;
    }

    echo json_encode($aa);

}

if($mType=='ProductSpecial000')
{
    $result = mysqli_query($db,"select p.product_id,p.image,p.model,p.tax_class_id, pd.name, od.name Option_Name, m.name Brand,ov.option_value_id Option_id, ov.quantity Option_quantity, ov.upc Option_UPC, p.upc, p.price, p.weight, p.status,p.quantity from oc_product p LEFT JOIN oc_manufacturer m ON p.manufacturer_id=m.manufacturer_id LEFT JOIN oc_product_description pd ON p.product_id=pd.product_id LEFT JOIN oc_product_option_value ov ON p.product_id=ov.product_id LEFT JOIN oc_option_value_description od ON ov.option_value_id=od.option_value_id order by p.product_id ASC limit $page,$pagesize");

    while ($row= mysqli_fetch_assoc($result))
    {
        

        $product_id = $row['product_id'];

        $result1 = mysqli_query($db,"SELECT * FROM `oc_product_special` WHERE `product_id` ='$product_id'");
        while ($row1= mysqli_fetch_assoc($result1))
        {
            $aa[]=$row1;
        }
    }

    echo json_encode($aa);

}


if($mType=='ProductSpecial')
{
    $result = mysqli_query($db,"SELECT t2.quantity,t1.product_special_id,t1.product_id,t1.customer_group_id,t2.option_value_id,t1.price,t1.priority,t1.date_start,t1.date_end FROM `oc_product_special` t1 JOIN oc_product_option_value t2 ON t1.`product_id` = t2.`product_id` union SELECT t5.quantity,t6.product_special_id,t6.product_id,t6.customer_group_id,'0',t6.price,t6.priority,t6.date_start,t6.date_end FROM `oc_product_special` t6 JOIN oc_product t5 ON t6.`product_id` = t5.`product_id` ORDER BY `product_id` ASC limit $page,$pagesize ");

    // echo "SELECT t2.quantity,t1.product_special_id,t1.product_id,t1.customer_group_id,t2.option_value_id,t1.price,t1.priority,t1.date_start,t1.date_end FROM `oc_product_special` t1 JOIN oc_product_option_value t2 ON t1.`product_id` = t2.`product_id` union SELECT t5.quantity,t6.product_special_id,t6.product_id,t6.customer_group_id,'0',t6.price,t6.priority,t6.date_start,t6.date_end FROM `oc_product_special` t6 JOIN oc_product t5 ON t6.`product_id` = t5.`product_id` ORDER BY `product_id` ASC limit $page,$pagesize ".'<br>';
    // exit();

    while ($row= mysqli_fetch_assoc($result))
    {
        $aa[]=$row;
    }

    echo json_encode($aa);

}


//get data from oc_category_description
if($mType=='getCategory')
{

    $result = mysqli_query($db,"select * from oc_category_description");

    while ($row= mysqli_fetch_assoc($result))
    {
        $aa[]=$row;
    }

    echo json_encode($aa);

}

if($mType=='copy')
{
    $result = mysqli_query($db,"select * from oc_product");
    while ($row= mysqli_fetch_assoc($result))
    {
        $aa[]=$row;
    }

    echo json_encode($aa);
}

//export oc_customer and oc_customer_group_description
if($mType=='customerList')
{
    $result = mysqli_query($db,"select * from oc_customer");
    while ($row= mysqli_fetch_assoc($result))
    {
        $aa[]=$row;
    }

    echo json_encode($aa);

}

if($mType=='customer_groupList')
{
    $result = mysqli_query($db,"select * from oc_customer_group_description p1 LEFT JOIN oc_customer_group p2 on p1.customer_group_id=p2.customer_group_id");
    while ($row= mysqli_fetch_assoc($result))
    {
        $aa[]=$row;
    }

    echo json_encode($aa);
}


//change warehouse quantity from pos run in stock transfer

if($mType=='stock_pos'){
    $quantity = $_POST['quantity'];
    $product_id = $_POST['product_id'];
    $method = $_POST['method'];

    if($method =="min"){

        echo $query = "UPDATE `oc_product` SET quantity=quantity-'$quantity' WHERE product_id='$product_id'";
    }

    if($method =="plus"){

        echo $query = "UPDATE `oc_product` SET quantity=quantity+'$quantity' WHERE product_id='$product_id'";
    }

   // echo $query = "UPDATE `oc_product` SET quantity=quantity+'$quantity' WHERE product_id='$product_id'";
    $res2 = mysqli_query($db,$query);

    if($res2){
        echo 'success';
    }else{
        echo 'wrong';
    }

}


