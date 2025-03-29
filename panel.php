<?php
require_once("class/class.php");
if (isset($_SESSION['acceso'])) {
if ($_SESSION['acceso'] == "administradorG" || $_SESSION["acceso"]=="administradorS" || $_SESSION["acceso"]=="secretaria" || $_SESSION["acceso"]=="cajero") {

$tra = new Login();
$ses = $tra->ExpiraSession();
$con = $tra->ContarRegistros();

$imp = new Login();
$imp = $imp->ImpuestosPorId();
$impuesto = $imp[0]['nomimpuesto'];
$valor = $imp[0]['valorimpuesto'];

$c = new Login();
$c = $c->ConfiguracionPorId();
$simbolo = "<strong>".$c[0]['simbolo']."</strong>";
?>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Ing. Ruben Chirinos">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title></title>

    <!-- Menu CSS -->
    <link href="assets/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="assets/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Datatables CSS -->
    <link href="assets/plugins/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">
    <!-- needed css -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="assets/css/default.css" id="theme" rel="stylesheet">

    <!-- script jquery -->
    <script src="assets/script/jquery.min.js"></script> 
    <script type="text/javascript" src="assets/script/titulos.js"></script>
    <script type="text/javascript" src="assets/plugins/chart.js/chart.min.js"></script>
    <script type="text/javascript" src="assets/script/graficos.js"></script>
    <!-- script jquery -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body onLoad="muestraReloj()" class="fix-header">
    
   <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <!--<div id="main-wrapper" data-layout="horizontal" data-navbarbg="skin6" data-sidebartype="mini-sidebar" data-boxed-layout="boxed" data-header-position="fixed" data-sidebar-position="fixed" class="mini-sidebar">-->

    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-boxed-layout="full" data-boxed-layout="boxed" data-header-position="fixed" data-sidebar-position="fixed" class="mini-sidebar">    

        <!-- INICIO DE MENU -->
        <?php include('menu.php'); ?>
        <!-- FIN DE MENU -->

        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb border-bottom">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-xs-12 align-self-center">
                    <h5 class="font-medium text-uppercase mb-0"><i class="fa fa-tasks"></i> Dashboard</h5>
                    </div>
                    <div class="col-lg-9 col-md-8 col-xs-12 align-self-center">
                        <nav aria-label="breadcrumb" class="mt-2 float-md-right float-left">
                            <ol class="breadcrumb mb-0 justify-content-end p-0">
                                <li class="breadcrumb-item"><a href="panel">Principal</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="page-content container-fluid">
                <!-- ============================================================== -->
                <!-- First Cards Row  -->
                <!-- ============================================================== -->

        <?php if ($_SESSION['acceso'] == "administradorG") { ?> 

                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Sucursales</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-bank text-primary"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['sucursales'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Usuarios</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-user text-info"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['usuarios'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Clientes</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-users text-danger"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['clientes'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Proveedores</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-truck text-success"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['proveedores'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


<!-- ============================================================== -->
<!-- Grafico por Sucursales  -->
<!-- ============================================================== -->
<div class="row">
    <div class="col-md-12 col-lg-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">
                    Gráficos de Sucursales del Año <?php echo date("Y"); ?>
                </h5>
                <div id="chart-container">
                    <canvas id="barChart" width="400" height="100"></canvas>
                </div>
                    <script>
                    $(document).ready(function () {
                        showGraphBarS();
                    });
                    </script>
            </div>
        </div>
    </div>
</div>


        <?php } else { ?>

                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Usuarios</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-user text-info"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['usuarios'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Productos</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-cubes text-primary"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['productos'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Clientes</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-users text-danger"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['clientes'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">Proveedores</h5>
                                <div class="d-flex align-items-center mb-2 mt-4">
                                    <h2 class="mb-0 display-5"><i class="fa fa-truck text-success"></i></h2>
                                    <div class="ml-auto">
                                        <h2 class="mb-0 display-6"><span class="font-normal"><?php echo $con[0]['proveedores'] ?></span></h2>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<!-- ============================================================== -->
<!-- Graficos Individual por Sucursal -->
<!-- ============================================================== -->
<div class="row">
    <div class="col-md-12 col-lg-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title text-uppercase mb-0">
                Gráfico de Registros
            </h5>
            <div id="chart-container">
                <canvas id="bar-chart" width="800" height="400"></canvas>
            </div>
            <script>
                    // Bar chart
                    new Chart(document.getElementById("bar-chart"), {
                        type: 'bar',
                        data: {
                            labels: ["Clientes", "Proveedores", "Productos", "Cotizaciones", "Compras", "Ventas"],
                            datasets: [
                            {
                                label: "Cantidad Nº",
                                backgroundColor: ["#ff7676", "#3e95cd","#3cba9f","#003399","#f0ad4e","#969788"],
                                data: [<?php echo $con[0]['clientes'] ?>,<?php echo $con[0]['proveedores'] ?>,<?php echo $con[0]['productos'] ?>,<?php echo $con[0]['cotizaciones'] ?>,<?php echo $con[0]['compras'] ?>,<?php echo $con[0]['ventas'] ?>]
                            }
                            ]
                        },
                        options: {
                            legend: { display: false },
                            title: {
                                display: true,
                                text: 'Cantidad de Registros'
                            }
                        }
                    });
                </script>
            </div>
        </div>
    </div>


<?php  
$cotizacion = new Login();
$cotmes = $cotizacion->SumaCotizaciones();

$compra = new Login();
$commes = $compra->SumaCompras();

$venta = new Login();
$venmes = $venta->SumaVentas();

?>

<div class="col-md-12 col-lg-6">
    <div class="card">
        <div class="card-body">
           <h5 class="card-title text-uppercase mb-0">
            Cotizaciones del Año <?php echo date("Y"); ?>  
            </h5>
                    <div id="chart-container">
                    <canvas id="bar-chart2" width="800" height="400"></canvas>
                    </div>
                    <script>
                            // Bar chart
                            new Chart(document.getElementById("bar-chart2"), {
                                type: 'bar',
                                data: {
                                    labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                                    datasets: [
                                    {
                                        label: "Monto Mensual",
                            backgroundColor: ["#CACFD8","#F2D6C4","#7B82EC","#ff7676","#987DDB","#E8AC9E","#7DA5EA","#8EE1BC","#D3E37D","#E399DA","#F7BE81","#FA5858"],
                            data: [<?php 

                              if($cotmes == "") { echo 0; } else {

                                  $meses = array(1 => 0, 2=> 0, 3=> 0, 4=> 0, 5=> 0, 6=> 0, 7=> 0, 8=> 0, 9=> 0, 10=> 0, 11=> 0, 12 => 0);
                                  foreach($cotmes as $row) {
                                    $mes = $row['mes'];
                                    $meses[$mes] = $row['totalmes'];
                                }
                                foreach($meses as $mes) {
                                    echo "{$mes},"; } } ?>]
                                }]
                            },
                            options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: 'Suma de Monto Mensual'
                                }
                            }
                        });
                    </script>
                </div>
            </div>

        </div>
    </div>

  <div class="row">
    <div class="col-md-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">
                    Compras del Año <?php echo date("Y"); ?>
                </h5>
                    <div id="chart-container">
                    <canvas id="bar-chart3" width="800" height="400"></canvas>
                    </div>
                    <script>
                            // Bar chart
                            new Chart(document.getElementById("bar-chart3"), {
                                type: 'bar',
                                data: {
                                    labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                                    datasets: [
                                    {
                                        label: "Monto Mensual",
                                        backgroundColor: ["#ff7676","#3e95cd","#808080","#F38630","#25AECD","#008080","#00FFFF","#3cba9f","#2E64FE","#e8c3b9","#F7BE81","#FA5858"],
                                        data: [<?php 

                              if($commes == "") { echo 0; } else {

                                  $meses = array(1 => 0, 2=> 0, 3=> 0, 4=> 0, 5=> 0, 6=> 0, 7=> 0, 8=> 0, 9=> 0, 10=> 0, 11=> 0, 12 => 0);
                                  foreach($commes as $row) {
                                    $mes = $row['mes'];
                                    $meses[$mes] = $row['totalmes'];
                                }
                                foreach($meses as $mes) {
                                    echo "{$mes},"; } } ?>]
                                }]
                            },
                            options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: 'Suma de Monto Mensual'
                                }
                            }
                        });
                    </script>
            </div>
        </div>
    </div>

    <div class="col-md-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">
                    Ventas del Año <?php echo date("Y"); ?>
                </h5>
                       <div id="chart-container">
                       <canvas id="bar-chart4" width="800" height="400"></canvas>
                       </div>
                       <script>
                            // Bar chart
                            new Chart(document.getElementById("bar-chart4"), {
                                type: 'bar',
                                data: {
                                    labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                                    datasets: [
                                    {
                                        label: "Monto Mensual",
                                        backgroundColor: ["#ff7676","#3e95cd","#808080","#F38630","#7B82EC","#8EE1BC","#D3E37D","#E8AC9E","#2E64FE","#E399DA","#F7BE81","#FA5858"],
                                        data: [<?php 

                              if($venmes == "") { echo 0; } else {

                                  $meses = array(1 => 0, 2=> 0, 3=> 0, 4=> 0, 5=> 0, 6=> 0, 7=> 0, 8=> 0, 9=> 0, 10=> 0, 11=> 0, 12 => 0);
                                  foreach($venmes as $row) {
                                    $mes = $row['mes'];
                                    $meses[$mes] = $row['totalmes'];
                                }
                                foreach($meses as $mes) {
                                    echo "{$mes},"; } } ?>]
                                }]
                            },
                            options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: 'Suma de Monto Mensual'
                                }
                            }
                        });
                    </script>
                </div>
            </div>

        </div>
    </div>



<div class="row">
    <div class="col-md-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">
                    5 Productos Mas Vendidos del Año <?php echo date("Y"); ?>
                </h5>
                    <div id="chart-container">
                    <canvas id="DoughnutChart" width="800" height="500"></canvas>
                    </div>
                    <script>
                    $(document).ready(function () {
                        showGraphDoughnutPV();
                    });
                    </script>
            </div>
        </div>
    </div>

    <div class="col-md-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">
                    Total en Ventas del Año <?php echo date("Y"); ?>
                </h5>
                       <div id="chart-container">
                    <canvas id="DoughnutChart2" width="800" height="500"></canvas>
                </div>
                    <script>
                    $(document).ready(function () {
                        showGraphDoughnutVU();
                    });
                    </script>
                       
                </div>
            </div>

        </div>
    </div>




    <!-- Row -->
    <div class="row">
       <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header bg-danger">
                <h4 class="card-title text-white"><i class="fa fa-tasks"></i> Ventas de Hoy <?php echo date("d-m-Y"); ?></h4>
                </div>
                <div class="form-body">
                    <div class="card-body">

<div class="table-responsive"><table id="default_order" class="table table-striped table-bordered border display">
                              <thead>
                                <tr class="text-center">
                                  <th>Nº</th>
                                  <th>N° de Venta</th>
                                  <th>Caja</th>
                                  <th>Descripción de Cliente</th>
                                  <th>Grab</th>
                                  <th>Exen</th>
                                  <th><?php echo $impuesto == '' ? "Impuesto" : $imp[0]['nomimpuesto']; ?></th>
                                  <th>Imp. Total</th>
                                  <th>Status</th>
                                  <th>Pdf</th>
                                </tr>
                              </thead>
                              <tbody>
<?php
$venta = new Login();
$reg = $venta->BuscarVentasDiarias(); 
 
 if($reg==""){
    
    echo "<div class='alert alert-danger'>";
    echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
    echo "<center><span class='fa fa-info-circle'></span> NO SE ENCONTRARON VENTAS REGISTRADAS ACTUALMENTE </center>";
    echo "</div>";    

} else {

$a=1;
$TotalArticulos=0;
$TotalGravado=0;
$TotalExento=0;
$TotalImporte=0;

for($i=0;$i<sizeof($reg);$i++){ 
   
$TotalArticulos+=$reg[$i]['articulos'];
$TotalGravado+=$reg[$i]['subtotalivasi'];
$TotalExento+=$reg[$i]['subtotalivano'];
$TotalImporte+=$reg[$i]['totalpago'];
?>
                                <tr class="text-center">
                      <td><?php echo $a++; ?></div>
                      <td><?php echo $reg[$i]['codventa']; ?></td>
                      <td><?php echo $reg[$i]['nrocaja'].": ".$reg[$i]['nomcaja']; ?></td>
<td><abbr title="<?php echo $reg[$i]['codcliente'] == '0' ? "CONSUMIDOR FINAL" : "Nº ".$documento = ($reg[$i]['documcliente'] == '0' ? "DOCUMENTO" : $reg[$i]['documento3']).": ".$reg[$i]['dnicliente']; ?>"><?php echo $reg[$i]['codcliente'] == '0' ? "CONSUMIDOR FINAL" : $reg[$i]['nomcliente']; ?></abbr></td> 
      <td class="text-center"><?php echo $simbolo." ".number_format($reg[$i]['subtotalivasi'], 2, '.', ','); ?></td>
      <td class="text-center"><?php echo $simbolo." ".number_format($reg[$i]['subtotalivano'], 2, '.', ','); ?></td>
      <td class="text-center"><?php echo $simbolo." ".number_format($reg[$i]['totaliva'], 2, '.', ','); ?><sup><?php echo $reg[$i]['iva']; ?>%</sup></td>
      <td class="text-center"><abbr title="Nº DE ARTICULOS: <?php echo $reg[$i]['articulos']; ?>"><?php echo $simbolo." ".number_format($reg[$i]['totalpago'], 2, '.', ','); ?></abbr></td>
      <td><?php 
if($reg[$i]['fechavencecredito']== '0000-00-00') { echo "<span class='badge badge-pill badge-info'><i class='fa fa-check'></i> ".$reg[$i]["statusventa"]."</span>"; } 
elseif($reg[$i]['fechavencecredito'] >= date("Y-m-d")) { echo "<span class='badge badge-pill badge-success'><i class='fa fa-exclamation-circle'></i> ".$reg[$i]["statusventa"]."</span>"; } 
elseif($reg[$i]['fechavencecredito'] < date("Y-m-d")) { echo "<span class='badge badge-pill badge-danger'><i class='fa fa-times'></i> VENCIDA</span>"; } ?></td>
<td><a href="reportepdf?codventa=<?php echo encrypt($reg[$i]['codventa']); ?>&codsucursal=<?php echo encrypt($reg[$i]['codsucursal']); ?>&tipo=<?php echo encrypt($reg[$i]['tipodocumento']) ?>" target="_blank" rel="noopener noreferrer"><button type="button" class="btn btn-secondary btn-rounded" title="Imprimir Pdf"><i class="fa fa-print"></i></button></a></td>
                                </tr>
                        <?php } ?>
                    <?php } ?>
                    </tbody>
                </table></div>


                    </div>
                </div>

                </div>
            </div>
        </div>
</div>
<!-- End Row -->

<?php } ?> 


            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                <i class="fa fa-copyright"></i> <span class="current-year"></span>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- apps -->
    <script src="assets/js/app.min.js"></script>
    <script src="assets/js/app.init.horizontal-fullwidth.js"></script>
    <script src="assets/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/js/perfect-scrollbar.js"></script>
    <script src="assets/js/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.js"></script>

    <!-- jQuery -->
    <script src="assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>


    <!-- Datatables-->
    <script src="assets/plugins/datatables/dataTables.min.js"></script>
    <script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
    <script src="assets/plugins/datatables/datatable-basic.init.js"></script>

    <script type="text/javascript">
      $(document).ready(function() {
        $('#default_order').dataTable();
    } );
    </script>

</body>
</html>

<?php } else { ?>   
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER A ESTA PAGINA.\nCONSULTA CON EL ADMINISTRADOR PARA QUE TE DE ACCESO')  
        document.location.href='logout'   
        </script> 
<?php } } else { ?>
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER AL SISTEMA.\nDEBERA DE INICIAR SESION')  
        document.location.href='logout'  
        </script> 
<?php } ?>