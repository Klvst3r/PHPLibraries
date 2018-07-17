	<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reporte Excel</title>
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css"/> -->
<link rel="stylesheet" type="text/css" href="inc/datatables.css"/>


<!-- <script type="text/javascript" src="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.js"></script> -->
<script type="text/javascript" src="inc/datatables.js"></script>


	<div class="container" style="padding:20px;20px;">
      <div class="">
        <h1>Data Table with Export features Using PHP server-side</h1>
        <div class="">
		<table id="employee_grid" class="display" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Folio</th>
			    <th>Asunto</th>
                <th>Referencia</th>
                <th>Origen</th>
                <th>Respuesta</th>
                <th>Observacion</th>
            </tr>
        </thead>


    </table>
    </div>
      </div>

    </div>

<script type="text/javascript">
$( document ).ready(function() {
$('#employee_grid').DataTable({
		 "processing": true,
         "sAjaxSource":"response.php",
		 "dom": 'lBfrtip',
		 "buttons": [
            {
                extend: 'collection',
                text: 'Exportar',
                buttons: [
                    'copy',
                    'excel',
                    'csv',
                    'pdf',
                    'print'
                ]
            }
        ]
        });
});
</script>
