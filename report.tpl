<html>
    <head>
        <title>{{title}}</title>
    </head>
    <style>
        body {
            font-family: 'Verdana', sans-serif;
        }

        h1 {
            text-align: center;
        }

        h2 {
            text-align: center;
            border-top: 1px dashed gray;
            padding-top: 0.3em;
        }
    </style>
    <body>
        <h1>{{title}}</h1>

        <p>Plots show mean &plusmn; 3 sample standard deviations. Error bars are often invisible.</p>

        {% for name, bench in benchmarks %}
            <h2>{{name}}</h2>
        
            <h3>Compilation</h3>
            <img src="{{name}}-compilation.png" />

            <h3>Runtime</h3>
            <div>
                <img src="{{name}}-runtime.png" />
                <img src="{{name}}-runtime-loglog.png" />
            </div>
            
            <!--
            <table>
                <tr>
                    <td>Input size</td>
                    <td>Mean</td>
                    <td>Stdev</td>
                </tr>
                {% for iname, istat in runtime[name].iteritems() %}
                <tr>
                    <th colspan="3">{{iname}}</th>
                <tr>
    
                    {% for size, stat in istat %}
                    <tr>
                        <td>{{size}}</td>
                        <td>{{stat.mean}}</td>
                        <td>{{stat.stdev}}</td>
                    </tr>
                    {% endfor %}
                {% endfor %}
            </table>
            -->
        {% endfor %}
    </body>
</html>
