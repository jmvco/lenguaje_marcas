declare option output:indent "yes";
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Título de series</title>
    </head>
    <body>
        <h1>Series de Tv</h1>
        <ul>{
        for $serie in/series/serie
        return 
            <li>
            { $serie/titulo/text() }
            
            { $serie/valoracion/text() }
            </li>
        }</ul>
    </body>
</html>