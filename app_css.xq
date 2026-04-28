declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html";
declare option output:indent "yes";


<html>
  <head>
    <title>Mi super proyecto final de peces</title>
      <style>
      .contenedor
      {{
        display: flex;
        align-items: center;
        flex-direction: column;
      }}
      body 
      {{ 
        font-family: Arial, sans-serif;
        margin: 20px;
        background-image: linear-gradient(
          rgba(0, 0, 0, 0.59),
            rgba( 0, 0, 0, 0.4 )
        ), url("/image/messi_es_mejor.png");
        background-size: cover;
      }}
      h1 
      {{
        color: navy;
        text-align: left;
      }}
      table
      {{
        border-collapse: collapse;
        width: 700px;
      }}
      th,td
      {{
        border: 1px solid black;
        padding: 8px;
        text-align: left;
      }}
      th
      {{
        background-color: lightgrey;
      }}
      tr:nth-child(even) 
      {{
        background-color: #f2f2f2;
      }}
    </style>
  </head>
  <body>
    <div class="contenedor">
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

    if ($tanque != "") then substring($tanque, 1, 3)
    else if ($tanque = "") then "R12."
    else ""

let $qrNew :=
    if (contains($qr, "5")) then concat("5_", $qr)
    else if (not(contains($qr, "5"))) then concat($qr, "_not")
    else ""

where xs:integer($mida) <= 615
order by $mida
return

  <tr>
    <td>{ $indice}</td>
    <td>{ $id}</td>
    <td>{ $tanqueNew}</td>
    <td>{ $qrNew}</td>
    <td>{ $mida}</td>
  </tr>
}
    </table>
    </div>
  </body>
</html>