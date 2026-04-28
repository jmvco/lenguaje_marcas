declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html";
declare option output:indent "yes";


<html>
  <head>
    <title>Mi super proyecto final de peces</title>
  </head>
  <body>
    <h1>Mi listado de peces</h1>
    <table>
      <tr>
        <th>Iterador</th>
        <th>ID</th>
        <th>Tanque</th>
        <th>QR</th>
        <th>Medicion</th>
      </tr>
{
for $registro at $indice in doc("peces.xml")/peces/row
let $id := string($registro/id)
let $tanque := string($registro/tanque)
let $qr := string($registro/qr)
let $mida := string($registro/mida)
let $tanqueNew :=

    if ( $tanque != "" ) then substring($tanque, 1, 3)
    else if ($tanque = "") then "R12."
    else ""

let $qrNew :=
    if ( contains( $qr, "5" ) ) then concat( "5_", $qr )
    else if ( not( contains( $qr, "5" ) ) ) then concat( $qr, "_not" )
    else ""

where xs:integer( $mida ) <= 615
order by $mida
return

  <tr>
    <td>{ $indice }</td>
    <td>{ $id }</td>
    <td>{ $tanqueNew }</td>
    <td>{ $qrNew }</td>
    <td>{ $mida }</td>
  </tr>
}
    </table>
  </body>
</html>