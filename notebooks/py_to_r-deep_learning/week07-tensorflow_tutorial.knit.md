
<!-- rnb-text-begin -->

---
title: "R Notebook"
output: html_notebook
---



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShyZXRpY3VsYXRlKVxuXG5yZXRpY3VsYXRlOjp1c2VfY29uZGFlbnYoXCJyLXRlbnNvcmZsb3dcIilcbmBgYCJ9 -->

```r
library(reticulate)

reticulate::use_condaenv("r-tensorflow")
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG4gIE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnbWF0cGxvdGxpYidcblxuRGV0YWlsZWQgdHJhY2ViYWNrOiBcbiAgRmlsZSBcIjxzdHJpbmc+XCIsIGxpbmUgMSwgaW4gPG1vZHVsZT5cbiJ9 -->

```

  ModuleNotFoundError: No module named 'matplotlib'

Detailed traceback: 
  File "<string>", line 1, in <module>
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


The original r-tensorflow does not come with `matplotlib`.
We will have to go back and install it in the environment.

      ModuleNotFoundError: No module named 'matplotlib'
      

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmV0aWN1bGF0ZTo6Y29uZGFfbGlzdCgpXG5gYGAifQ== -->

```r
reticulate::conda_list()
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibmNvbCI6MiwibnJvdyI6M30sInJkZiI6Ikg0c0lBQUFBQUFBQUJvV1IwVXJETUJTR1Q1UFdzZUpVOERsYTJHUU12Qk45QWtIWVJXOWltNjVsM1VsSk1qZTk4c21uU1p0QVY0VUZrcHo4eVhkTy91VDFaYjJJMXpFQUVLQlJBSVNhTUNSbUNDQ0VxWjJQQVBTK093QndaenAxRzVQMlV3dVpWMjU1TFJQTlVRbFpOdUxndEhpZ25NT0w1OGZzVFhHcHNwMHF2MWJMZWZhRUxCZFlzSWVNNDRmS1hISTdWd0pUZnVTT1hGMGloL2Y0aXk4djRmL0Q1MjhTSWR0eDVTd1JKNFpXZFBGVmo0NndxUlNIMUtNemkzNUQxK2c0Zjk0dzVmTjdNUzZZWm1rcGJSV0Ewd2laaUZiWEFnMUU3R2RGSXppUUkrRjJqL1ltUlpKWGU5d21jMXVnMis3YnpNVjBFSk8rSlBseHFTSnZsdU9tUm04OWF0ZzdiOXppeGpqdURLZXRyRkY3SjBaVnFSYWErWE54TGhxdmRON2c5QXVFeUpnMG1nSUFBQT09In0= -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["python"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"pytorch","2":"C:\\\\Users\\\\msfz751\\\\Anaconda3\\\\envs\\\\pytorch\\\\python.exe"},{"1":"r-tensorflow","2":"C:\\\\Users\\\\msfz751\\\\Anaconda3\\\\envs\\\\r-tensorflow\\\\python.exe"},{"1":"tensorflow","2":"C:\\\\Users\\\\msfz751\\\\Anaconda3\\\\envs\\\\tensorflow\\\\python.exe"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[3]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

     

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmV0aWN1bGF0ZTo6cHlfY29uZmlnKClcbmBgYCJ9 -->

```r
reticulate::py_config()
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoicHl0aG9uOiAgICAgICAgIEM6XFxVc2Vyc1xcbXNmejc1MVxcQW5hY29uZGEzXFxlbnZzXFxyLXRlbnNvcmZsb3dcXHB5dGhvbi5leGVcbmxpYnB5dGhvbjogICAgICBDOi9Vc2Vycy9tc2Z6NzUxL0FuYWNvbmRhMy9lbnZzL3ItdGVuc29yZmxvdy9weXRob24zNi5kbGxcbnB5dGhvbmhvbWU6ICAgICBDOlxcVXNlcnNcXG1zZno3NTFcXEFOQUNPTn4xXFxlbnZzXFxSLVRFTlN+MVxudmVyc2lvbjogICAgICAgIDMuNi42IHwgcGFja2FnZWQgYnkgY29uZGEtZm9yZ2UgfCAoZGVmYXVsdCwgSnVsIDI2IDIwMTgsIDExOjQ4OjIzKSBbTVNDIHYuMTkwMCA2NCBiaXQgKEFNRDY0KV1cbkFyY2hpdGVjdHVyZTogICA2NGJpdFxubnVtcHk6ICAgICAgICAgIEM6XFxVc2Vyc1xcbXNmejc1MVxcQU5BQ09OfjFcXGVudnNcXFItVEVOU34xXFxsaWJcXHNpdGUtcGFja2FnZXNcXG51bXB5XG5udW1weV92ZXJzaW9uOiAgMS4xNS4zXG5cbnB5dGhvbiB2ZXJzaW9ucyBmb3VuZDogXG4gQzpcXFVzZXJzXFxtc2Z6NzUxXFxBbmFjb25kYTNcXGVudnNcXHItdGVuc29yZmxvd1xccHl0aG9uLmV4ZVxuIEM6XFxVc2Vyc1xcbXNmejc1MVxcQU5BQ09OfjFcXHB5dGhvbi5leGVcbiBDOlxcVXNlcnNcXG1zZno3NTFcXEFuYWNvbmRhM1xcZW52c1xccHl0b3JjaFxccHl0aG9uLmV4ZVxuIEM6XFxVc2Vyc1xcbXNmejc1MVxcQW5hY29uZGEzXFxlbnZzXFx0ZW5zb3JmbG93XFxweXRob24uZXhlXG4ifQ== -->

```
python:         C:\Users\msfz751\Anaconda3\envs\r-tensorflow\python.exe
libpython:      C:/Users/msfz751/Anaconda3/envs/r-tensorflow/python36.dll
pythonhome:     C:\Users\msfz751\ANACON~1\envs\R-TENS~1
version:        3.6.6 | packaged by conda-forge | (default, Jul 26 2018, 11:48:23) [MSC v.1900 64 bit (AMD64)]
Architecture:   64bit
numpy:          C:\Users\msfz751\ANACON~1\envs\R-TENS~1\lib\site-packages\numpy
numpy_version:  1.15.3

python versions found: 
 C:\Users\msfz751\Anaconda3\envs\r-tensorflow\python.exe
 C:\Users\msfz751\ANACON~1\python.exe
 C:\Users\msfz751\Anaconda3\envs\pytorch\python.exe
 C:\Users\msfz751\Anaconda3\envs\tensorflow\python.exe
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyByZXRpY3VsYXRlOjpweV9hdmFpbGFibGUoKVxuYGBgIn0= -->

```r
# reticulate::py_available()
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

     

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiMFxuIn0= -->

```
0
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

      

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiUjpcXGdpdGh1Yi1hbGZvbnNvXFxyRGVlcFRob3VnaHRcXG5vdGVib29rc1xcZGVlcC1sZWFybmluZy1weS10by1yXG4ifQ== -->

```
R:\github-alfonso\rDeepThought\notebooks\deep-learning-py-to-r
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgcHl0aG9uXG5pbXBvcnQgb3Ncbm9zLnN5c3RlbShcImNvbmRhIGluc3RhbGwgbWF0cGxvdGxpYlwiKVxuYGBgIn0= -->

```python
import os
os.system("conda install matplotlib")
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->

