<?php
//Nhúng file PHPExcel
require_once './Classes/PHPExcel.php';
const NameTable="film";
//Đường dẫn file
$file = 'anime _type3.xlsx';
//Tiến hành xác thực file
$objFile = PHPExcel_IOFactory::identify($file);
$objData = PHPExcel_IOFactory::createReader($objFile);

// //Chỉ đọc dữ liệu
// $objData->setReadDataOnly(true);

// Load dữ liệu sang dạng đối tượng
$objPHPExcel = $objData->load($file);

//Lấy ra số trang sử dụng phương thức getSheetCount();
// Lấy Ra tên trang sử dụng getSheetNames();

//Chọn trang cần truy xuất
$sheet = $objPHPExcel->setActiveSheetIndex(0);

//Lấy ra số dòng cuối cùng
$Totalrow = $sheet->getHighestRow();
//Lấy ra tên cột cuối cùng
$LastColumn = $sheet->getHighestColumn();

//Chuyển đổi tên cột đó về vị trí thứ, VD: C là 3,D là 4
$TotalCol = PHPExcel_Cell::columnIndexFromString($LastColumn);

//Tạo mảng chứa dữ liệu
$data = [];

//Tiến hành lặp qua từng ô dữ liệu
//----Lặp dòng, Vì dòng đầu là tiêu đề cột nên chúng ta sẽ lặp giá trị từ dòng 2
for ($i = 3; $i <= $Totalrow; $i++) {
    //----Lặp cột
    for ($j = 0; $j < $TotalCol; $j++) {
        // Tiến hành lấy giá trị của từng ô đổ vào mảng
        $data[$i - 2][$j] = $sheet->getCellByColumnAndRow($j, $i)->getValue();;
    }
}
//Hiển thị mảng dữ liệu

        // echo '<pre>';
        // print_r($data);
        // echo "</pre>";
        $sql="";
foreach ($data as $key => $value) {
    $sql .= Insert(NameTable,['flim_name'=>$value[0],"film_name_real"=>$value[1],
                              "film_trangthai"=>$value[2],'film_type'=>$value[3],
                              'film_mota'=>$value[4],'film_tacgia'=>$value[5],'film_date_aired'=>$value[6],
                              'film_views'=>$value[7],'film_quality'=>$value[8],'film_duration'=>$value[9],
                              'film_rating'=>$value[10],'film_scores'=>$value[11],'flim_assessor'=>$value[12],
                              'film_img'=>$value[13],'film_traller'=>$value[14],'film_current_episode'=>$value[15],
                              'film_end_episode'=>$value[16],'film_showtimes'=>$value[17]
                                ]).";";
}
// tạo try vấn
function Insert($table,$data=[])
{
    $colums=implode(",", array_keys($data));
    $newvalue=array_map(function($value)
    {
        return "'".$value."'";
    },array_values($data));
    $value=implode(",",array_values($newvalue));
    $sql="INSERT INTO ${table}(${colums}) value (${value})";
    return $sql;  
}
// echo $sql;
$myfile= fopen("test.sql", "w");
    fwrite($myfile, $sql);
    fclose($myfile);