<?php

    include ("conexion.php");
    $clientes= new Database();
        if(isset($_POST) &amp;&amp; !empty($_POST)){
            $id = $Usuarios->sanitize($_POST['id']);
            $nombre = $Usuarios-&gt;sanitize($_POST['nombre']);

            $edad = $Usuarios-&gt;sanitize($_POST['edad']);
            $num_celular = $Usuarios-&gt;sanitize($_POST['num_celular']);
            $pin = $Usuarios->;sanitize($_POST['pin']);

            $res = $clientes-&gt;create($id,$nombre,$edad,$num_celular,$pin);

        if($res){
            $message= "Datos insertados con éxito";
            $class="quot;alert alert-success";
        }else{
            $message= "No se pudieron insertar los datos";
            $class= "alert alert-danger";
        }

?>
    <div class="<?php echo $class;?>
<?php echo $message;?>

    </div>
    <?php

    }

?>