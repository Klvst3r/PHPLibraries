
<?php
	//include connection file 
	include_once("connection.php");
	 
	// initilize all variable
	$params = $columns = $totalRecords = $data = array();

	$params = $_REQUEST;

	//define index of column
	$columns = array( 
		0 =>'ID',
		1 =>'Folio', 
		2 => 'Asunto',
		3 => 'Referencia',
		4 => 'Origen',
		5 => 'Respuesta',
		6 => 'Observacion'
	);

	$where = $sqlTot = $sqlRec = "";

	// getting total number records without any search
	//$sql = "SELECT * FROM `employee` ";
	$sql = "SELECT A.id_turn as ID, A.folio_turned as Folio, B.subject_doc as Asunto, B.reference as Referencia, A.doc_origin as Origen, A.answer as Respuesta, A.observation as Observacion FROM documents_turned A, documents B WHERE (A.date_turned BETWEEN '2018-01-01' and '2018-07-05') and A.id_dir = '1' and A.id_doc = B.id_doc and A.id_classif = '2' ";
	$sqlTot .= $sql;
	$sqlRec .= $sql;


 	$sqlRec .=  " ORDER BY id_turn";

	$queryTot = mysqli_query($conn, $sqlTot) or die("database error:". mysqli_error($conn));


	$totalRecords = mysqli_num_rows($queryTot);

	$queryRecords = mysqli_query($conn, $sqlRec) or die("error to fetch employees data");

	//iterate on results row and create new index array of data
	while( $row = mysqli_fetch_row($queryRecords) ) { 
		$data[] = $row;
	}	

	$json_data = array(
			"draw"            => 1,   
			"recordsTotal"    => intval( $totalRecords ),  
			"recordsFiltered" => intval($totalRecords),
			"data"            => $data   // total data array
			);

	
	echo json_encode($json_data);  // send data as json format
?>
	