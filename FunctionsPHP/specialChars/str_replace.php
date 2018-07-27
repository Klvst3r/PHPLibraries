<?php

$cadena = "Esta es la cadena de ejemplo para sustituir un caracter";
echo $cadena;
echo "<br/>";
$resultado = str_replace("a", "A", $cadena);

echo "<b>La cadena resultante es:</b> " . $resultado;
 
$cadena2 = "Esta es la cadena de ejemplo para sustituir una cadena";
echo "<br/>";
echo "<br/>";
echo $cadena2;
$resultado2 = str_replace("cadena", "CADENA", $cadena2);
echo "<br/>";
echo "<b>La cadena resultante es: </b>" . $resultado2;

echo "<br/><br/><br/>";

// Provides: <body text='black'>
$bodytag = str_replace("%body%", "black", "<body text='%body%'>");

// Provides: Hll Wrld f PHP
$vowels = array("a", "e", "i", "o", "u", "A", "E", "I", "O", "U");
$acents = array("á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú");
$onlyconsonants = str_replace($vowels, $acents, "Hello World of PHP");

echo $onlyconsonants;
echo "<br/>";

// Provides: You should eat pizza, beer, and ice cream every day
$phrase  = "You should eat fruits, vegetables, and fiber every day.";
$healthy = array("fruits", "vegetables", "fiber");
$yummy   = array("pizza", "beer", "ice cream");

$newphrase = str_replace($healthy, $yummy, $phrase);

// Provides: 2
$str = str_replace("ll", "", "good golly miss molly!", $count);
echo $count;
echo "<br/>";
echo $newphrase;


?>