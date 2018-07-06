<?php


$servername = "localhost";
$username = "dev";
$password = "desarrollo";
$dbname = "siop";

$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Connection failed: " . mysqli_connect_error());

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}


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



	if(isset($_POST["ExportType"]))
{
	 
    switch($_POST["ExportType"])
    {
        case "export-to-excel" :
            // Submission from
			$filename = $_POST["ExportType"] . ".xls";		 
            header("Content-Type: application/vnd.ms-excel");
			header("Content-Disposition: attachment; filename=\"$filename\"");
			ExportFile($data);
			//$_POST["ExportType"] = '';
            exit();
		case "export-to-csv" :
            // Submission from
			$filename = $_POST["ExportType"] . ".csv";		 
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
			header("Content-type: text/csv");
			header("Content-Disposition: attachment; filename=\"$filename\"");
			header("Expires: 0");
			ExportCSVFile($data);
			//$_POST["ExportType"] = '';
            exit();
        default :
            die("Unknown action : ".$_POST["action"]);
            break;
    }
}
function ExportCSVFile($records) {
	// create a file pointer connected to the output stream
	$fh = fopen( 'php://output', 'w' );
	$heading = false;
		if(!empty($records))
		  foreach($records as $row) {
			if(!$heading) {
			  // output the column headings
			  fputcsv($fh, array_keys($row));
			  $heading = true;
			}
			// loop over the rows, outputting them
			 fputcsv($fh, array_values($row));
			 
		  }
		  fclose($fh);
}
function ExportFile($records) {
	$heading = false;
		if(!empty($records))
		  foreach($records as $row) {
			if(!$heading) {
			  // display field/column names as a first row
			  echo implode("\t", array_keys($row)) . "\n";
			  $heading = true;
			}
			echo implode("\t", array_values($row)) . "\n";
		  }
		exit;
}
?>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title>csv/excel</title>

<div><h3>PHP export to csv/excel file</h1></div>
<div> 
<div id="container" >
<div class="col-sm-6 pull-left">
                  <div class="well well-sm col-sm-12">
                      <b id='project-capacity-count-lable'><?php echo count($data);?></b> records found.
                   <div class="btn-group pull-right">
  <button type="button" class="btn btn-info">Exportar</button>


  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  
  <ul class="dropdown-menu" role="menu" id="export-menu">
    <li id="export-to-excel"><a href="#">Exportar a Excel</a></li>
	<li id="export-to-csv"><a href="#">Exportar a CSV</a></li>
    
  </ul>
</div>
				
                      </div>
					  <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post" id="export-form">
						<input type="hidden" value='' id='hidden-type' name='ExportType'/>
					  </form>
                  <table id="" class="table table-striped table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Folio</th>
                        <th>Asunto</th>
                        <th>Referencia</th>
                        <th>Origen</th>
                        <th>Respuesta</th>
                        <th>Observacion</th>
                  </tr>
                <tbody>
                  <?php foreach($data as $row):?>
				  <tr>
				  <td><?php echo $row [0]?></td>
				  <td><?php echo $row [1]?></td>
				  <td><?php echo $row [2]?></td>
				  <td><?php echo $row [3]?></td>
				  <td><?php echo $row [4]?></td>
				  <td><?php echo $row [5]?></td>
				  <td><?php echo $row [6]?></td>
				  </tr>
				  <?php endforeach; ?>
                </tbody>
              </table>
              </div></div>  

</div>
</body>   
<script  type="text/javascript">
$(document).ready(function() {
jQuery('#export-menu li').bind("click", function() {
var target = $(this).attr('id');
switch(target) {
	case 'export-to-excel' :
	$('#hidden-type').val(target);
	//alert($('#hidden-type').val());
	$('#export-form').submit();
	$('#hidden-type').val('');
	break
	case 'export-to-csv' :
	$('#hidden-type').val(target);
	//alert($('#hidden-type').val());
	$('#export-form').submit();
	$('#hidden-type').val('');
	break
}
});
    });
</script>
