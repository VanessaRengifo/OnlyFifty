<?php
	
	class Database{
		private $con;
		private $dbhost="localhost";
		private $dbuser="root";
		private $dbpass="";
		private $dbname="OnlyFifty+";
		function __construct(){
			$this->connect_db();
		}
		public function connect_db(){
			$this->con = mysqli_connect($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
			if(mysqli_connect_error()){
				die("Conexión a la base de datos falló " . mysqli_connect_error() . mysqli_connect_errno());
			}
		}
        
        public function sanitize($var){
            $return = mysqli_real_escape_string($this-&gt;con, $var);
            return $return;
        }
        public function create($nombres,$apellidos,$telefono,$direccion,$correo_electronico){
            $sql = "INSERT INTO `Usuarios` (id, nombre, edad, num_celular,
            pin) VALUES ('id','nombre','edad','num_celular','pin')";
            $res = mysqli_query($this->con, $sql);
            if($res){
                return true;
            }else{
                return false;
            }
        }
        public function read(){
            $sql = "SELECT * FROM Usuarios";
            $res = mysqli_query($this->con, $sql);
            return $res;
        }
        
        public function delete($id){
            $sql = "DELETE FROM Usuarios WHERE id=$id";
            $res = mysqli_query($this->con, $sql);
            if($res){
                return true;
            
            }else{
                return false;
            }
        }

}
?>
