declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xml";
declare option output:indent "yes";
<calculos>
{
    for $registro at $indice in doc("peces.xml")/peces/row
    let $id := $registro/id
    let $tanque := $registro/tanque
    let $qr := $registro/qr
    let $mida := $registro/mida
    let $tanqueNew := 
    if($tanque != "")
    then substring($tanque,1,3)
    else if($tanque = "")
    then "R12."
    else ""
    let $qrNew := 
    if(contains($qr,"5"))
    then concat("5_", $qr)
    else if (not(contains($qr,"5")))
    then concat($qr,"_not")
    else ""
    where $registro/mida <= 615
    order by $indice
    return $indice
}
</calculos>
