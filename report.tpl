<html>
    <head>
        <title>Benchmark results</title>
    </head>
    <body>
        <h1>Benchmark results</h1>

        {% for name, bench in results %}
            <h2>{{name}}</h2>

            <h3>Runtime</h3>
            <img src="{{name}}-runtime.png" /><br/>

            <table>
                <tr>
                    <td>Input size</td>
                    <td>Mean</td>
                    <td>Stdev</td>
                </tr>
                {% for size, stat in bench.runtime %}
                <tr>
                    <td>{{size}}</td>
                    <td>{{stat.mean}}</td>
                    <td>{{stat.stdev}}</td>
                </tr>
                {% endfor %}
            </table>
        {% endfor %}
    </body>
</html>
