{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c8f04dc7",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:21.530038Z",
     "iopub.status.busy": "2023-02-21T11:47:21.528173Z",
     "iopub.status.idle": "2023-02-21T11:47:22.826169Z",
     "shell.execute_reply": "2023-02-21T11:47:22.824285Z"
    },
    "papermill": {
     "duration": 1.305051,
     "end_time": "2023-02-21T11:47:22.828296",
     "exception": false,
     "start_time": "2023-02-21T11:47:21.523245",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df <- read.table(file = '/kaggle/input/weather-australia/weather_data_australia.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "41fa8d8c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:22.858978Z",
     "iopub.status.busy": "2023-02-21T11:47:22.834139Z",
     "iopub.status.idle": "2023-02-21T11:47:22.901903Z",
     "shell.execute_reply": "2023-02-21T11:47:22.900328Z"
    },
    "papermill": {
     "duration": 0.074052,
     "end_time": "2023-02-21T11:47:22.904606",
     "exception": false,
     "start_time": "2023-02-21T11:47:22.830554",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 23</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Date</th><th scope=col>Location</th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustDir</th><th scope=col>WindGustSpeed</th><th scope=col>WindDir9am</th><th scope=col>⋯</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainToday</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>12/1/2008 </td><td>Albury</td><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>W  </td><td>44</td><td>W  </td><td>⋯</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>12/2/2008 </td><td>Albury</td><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>WNW</td><td>44</td><td>NNW</td><td>⋯</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12/3/2008 </td><td>Albury</td><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>WSW</td><td>46</td><td>W  </td><td>⋯</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12/4/2008 </td><td>Albury</td><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>NE </td><td>24</td><td>SE </td><td>⋯</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>12/5/2008 </td><td>Albury</td><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>W  </td><td>41</td><td>ENE</td><td>⋯</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>12/6/2008 </td><td>Albury</td><td>14.6</td><td>29.7</td><td>0.2</td><td>NA</td><td>NA</td><td>WNW</td><td>56</td><td>W  </td><td>⋯</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>NA</td><td>NA</td><td>20.6</td><td>28.9</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>12/7/2008 </td><td>Albury</td><td>14.3</td><td>25.0</td><td>0.0</td><td>NA</td><td>NA</td><td>W  </td><td>50</td><td>SW </td><td>⋯</td><td>49</td><td>19</td><td>1009.6</td><td>1008.2</td><td> 1</td><td>NA</td><td>18.1</td><td>24.6</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>12/8/2008 </td><td>Albury</td><td> 7.7</td><td>26.7</td><td>0.0</td><td>NA</td><td>NA</td><td>W  </td><td>35</td><td>SSE</td><td>⋯</td><td>48</td><td>19</td><td>1013.4</td><td>1010.1</td><td>NA</td><td>NA</td><td>16.3</td><td>25.5</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>12/9/2008 </td><td>Albury</td><td> 9.7</td><td>31.9</td><td>0.0</td><td>NA</td><td>NA</td><td>NNW</td><td>80</td><td>SE </td><td>⋯</td><td>42</td><td> 9</td><td>1008.9</td><td>1003.6</td><td>NA</td><td>NA</td><td>18.3</td><td>30.2</td><td>No </td><td>1</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>12/10/2008</td><td>Albury</td><td>13.1</td><td>30.1</td><td>1.4</td><td>NA</td><td>NA</td><td>W  </td><td>28</td><td>S  </td><td>⋯</td><td>58</td><td>27</td><td>1007.0</td><td>1005.7</td><td>NA</td><td>NA</td><td>20.1</td><td>28.2</td><td>Yes</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 23\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & Date & Location & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustDir & WindGustSpeed & WindDir9am & ⋯ & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainToday & RainTomorrow\\\\\n",
       "  & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <int> & <chr> & ⋯ & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 12/1/2008  & Albury & 13.4 & 22.9 & 0.6 & NA & NA & W   & 44 & W   & ⋯ & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & No  & 2\\\\\n",
       "\t2 & 12/2/2008  & Albury &  7.4 & 25.1 & 0.0 & NA & NA & WNW & 44 & NNW & ⋯ & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & No  & 2\\\\\n",
       "\t3 & 12/3/2008  & Albury & 12.9 & 25.7 & 0.0 & NA & NA & WSW & 46 & W   & ⋯ & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & No  & 2\\\\\n",
       "\t4 & 12/4/2008  & Albury &  9.2 & 28.0 & 0.0 & NA & NA & NE  & 24 & SE  & ⋯ & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & No  & 2\\\\\n",
       "\t5 & 12/5/2008  & Albury & 17.5 & 32.3 & 1.0 & NA & NA & W   & 41 & ENE & ⋯ & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & No  & 2\\\\\n",
       "\t6 & 12/6/2008  & Albury & 14.6 & 29.7 & 0.2 & NA & NA & WNW & 56 & W   & ⋯ & 55 & 23 & 1009.2 & 1005.4 & NA & NA & 20.6 & 28.9 & No  & 2\\\\\n",
       "\t7 & 12/7/2008  & Albury & 14.3 & 25.0 & 0.0 & NA & NA & W   & 50 & SW  & ⋯ & 49 & 19 & 1009.6 & 1008.2 &  1 & NA & 18.1 & 24.6 & No  & 2\\\\\n",
       "\t8 & 12/8/2008  & Albury &  7.7 & 26.7 & 0.0 & NA & NA & W   & 35 & SSE & ⋯ & 48 & 19 & 1013.4 & 1010.1 & NA & NA & 16.3 & 25.5 & No  & 2\\\\\n",
       "\t9 & 12/9/2008  & Albury &  9.7 & 31.9 & 0.0 & NA & NA & NNW & 80 & SE  & ⋯ & 42 &  9 & 1008.9 & 1003.6 & NA & NA & 18.3 & 30.2 & No  & 1\\\\\n",
       "\t10 & 12/10/2008 & Albury & 13.1 & 30.1 & 1.4 & NA & NA & W   & 28 & S   & ⋯ & 58 & 27 & 1007.0 & 1005.7 & NA & NA & 20.1 & 28.2 & Yes & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 23\n",
       "\n",
       "| <!--/--> | Date &lt;chr&gt; | Location &lt;chr&gt; | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustDir &lt;chr&gt; | WindGustSpeed &lt;int&gt; | WindDir9am &lt;chr&gt; | ⋯ ⋯ | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainToday &lt;chr&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 12/1/2008  | Albury | 13.4 | 22.9 | 0.6 | NA | NA | W   | 44 | W   | ⋯ | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | No  | 2 |\n",
       "| 2 | 12/2/2008  | Albury |  7.4 | 25.1 | 0.0 | NA | NA | WNW | 44 | NNW | ⋯ | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | No  | 2 |\n",
       "| 3 | 12/3/2008  | Albury | 12.9 | 25.7 | 0.0 | NA | NA | WSW | 46 | W   | ⋯ | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | No  | 2 |\n",
       "| 4 | 12/4/2008  | Albury |  9.2 | 28.0 | 0.0 | NA | NA | NE  | 24 | SE  | ⋯ | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | No  | 2 |\n",
       "| 5 | 12/5/2008  | Albury | 17.5 | 32.3 | 1.0 | NA | NA | W   | 41 | ENE | ⋯ | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | No  | 2 |\n",
       "| 6 | 12/6/2008  | Albury | 14.6 | 29.7 | 0.2 | NA | NA | WNW | 56 | W   | ⋯ | 55 | 23 | 1009.2 | 1005.4 | NA | NA | 20.6 | 28.9 | No  | 2 |\n",
       "| 7 | 12/7/2008  | Albury | 14.3 | 25.0 | 0.0 | NA | NA | W   | 50 | SW  | ⋯ | 49 | 19 | 1009.6 | 1008.2 |  1 | NA | 18.1 | 24.6 | No  | 2 |\n",
       "| 8 | 12/8/2008  | Albury |  7.7 | 26.7 | 0.0 | NA | NA | W   | 35 | SSE | ⋯ | 48 | 19 | 1013.4 | 1010.1 | NA | NA | 16.3 | 25.5 | No  | 2 |\n",
       "| 9 | 12/9/2008  | Albury |  9.7 | 31.9 | 0.0 | NA | NA | NNW | 80 | SE  | ⋯ | 42 |  9 | 1008.9 | 1003.6 | NA | NA | 18.3 | 30.2 | No  | 1 |\n",
       "| 10 | 12/10/2008 | Albury | 13.1 | 30.1 | 1.4 | NA | NA | W   | 28 | S   | ⋯ | 58 | 27 | 1007.0 | 1005.7 | NA | NA | 20.1 | 28.2 | Yes | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "   Date       Location MinTemp MaxTemp Rainfall Evaporation Sunshine\n",
       "1  12/1/2008  Albury   13.4    22.9    0.6      NA          NA      \n",
       "2  12/2/2008  Albury    7.4    25.1    0.0      NA          NA      \n",
       "3  12/3/2008  Albury   12.9    25.7    0.0      NA          NA      \n",
       "4  12/4/2008  Albury    9.2    28.0    0.0      NA          NA      \n",
       "5  12/5/2008  Albury   17.5    32.3    1.0      NA          NA      \n",
       "6  12/6/2008  Albury   14.6    29.7    0.2      NA          NA      \n",
       "7  12/7/2008  Albury   14.3    25.0    0.0      NA          NA      \n",
       "8  12/8/2008  Albury    7.7    26.7    0.0      NA          NA      \n",
       "9  12/9/2008  Albury    9.7    31.9    0.0      NA          NA      \n",
       "10 12/10/2008 Albury   13.1    30.1    1.4      NA          NA      \n",
       "   WindGustDir WindGustSpeed WindDir9am ⋯ Humidity9am Humidity3pm Pressure9am\n",
       "1  W           44            W          ⋯ 71          22          1007.7     \n",
       "2  WNW         44            NNW        ⋯ 44          25          1010.6     \n",
       "3  WSW         46            W          ⋯ 38          30          1007.6     \n",
       "4  NE          24            SE         ⋯ 45          16          1017.6     \n",
       "5  W           41            ENE        ⋯ 82          33          1010.8     \n",
       "6  WNW         56            W          ⋯ 55          23          1009.2     \n",
       "7  W           50            SW         ⋯ 49          19          1009.6     \n",
       "8  W           35            SSE        ⋯ 48          19          1013.4     \n",
       "9  NNW         80            SE         ⋯ 42           9          1008.9     \n",
       "10 W           28            S          ⋯ 58          27          1007.0     \n",
       "   Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainToday RainTomorrow\n",
       "1  1007.1       8       NA       16.9    21.8    No        2           \n",
       "2  1007.8      NA       NA       17.2    24.3    No        2           \n",
       "3  1008.7      NA        2       21.0    23.2    No        2           \n",
       "4  1012.8      NA       NA       18.1    26.5    No        2           \n",
       "5  1006.0       7        8       17.8    29.7    No        2           \n",
       "6  1005.4      NA       NA       20.6    28.9    No        2           \n",
       "7  1008.2       1       NA       18.1    24.6    No        2           \n",
       "8  1010.1      NA       NA       16.3    25.5    No        2           \n",
       "9  1003.6      NA       NA       18.3    30.2    No        1           \n",
       "10 1005.7      NA       NA       20.1    28.2    Yes       2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "5737611a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:22.914064Z",
     "iopub.status.busy": "2023-02-21T11:47:22.912472Z",
     "iopub.status.idle": "2023-02-21T11:47:22.927261Z",
     "shell.execute_reply": "2023-02-21T11:47:22.925871Z"
    },
    "papermill": {
     "duration": 0.021678,
     "end_time": "2023-02-21T11:47:22.929207",
     "exception": false,
     "start_time": "2023-02-21T11:47:22.907529",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Date'</li><li>'Location'</li><li>'MinTemp'</li><li>'MaxTemp'</li><li>'Rainfall'</li><li>'Evaporation'</li><li>'Sunshine'</li><li>'WindGustDir'</li><li>'WindGustSpeed'</li><li>'WindDir9am'</li><li>'WindDir3pm'</li><li>'WindSpeed9am'</li><li>'WindSpeed3pm'</li><li>'Humidity9am'</li><li>'Humidity3pm'</li><li>'Pressure9am'</li><li>'Pressure3pm'</li><li>'Cloud9am'</li><li>'Cloud3pm'</li><li>'Temp9am'</li><li>'Temp3pm'</li><li>'RainToday'</li><li>'RainTomorrow'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Date'\n",
       "\\item 'Location'\n",
       "\\item 'MinTemp'\n",
       "\\item 'MaxTemp'\n",
       "\\item 'Rainfall'\n",
       "\\item 'Evaporation'\n",
       "\\item 'Sunshine'\n",
       "\\item 'WindGustDir'\n",
       "\\item 'WindGustSpeed'\n",
       "\\item 'WindDir9am'\n",
       "\\item 'WindDir3pm'\n",
       "\\item 'WindSpeed9am'\n",
       "\\item 'WindSpeed3pm'\n",
       "\\item 'Humidity9am'\n",
       "\\item 'Humidity3pm'\n",
       "\\item 'Pressure9am'\n",
       "\\item 'Pressure3pm'\n",
       "\\item 'Cloud9am'\n",
       "\\item 'Cloud3pm'\n",
       "\\item 'Temp9am'\n",
       "\\item 'Temp3pm'\n",
       "\\item 'RainToday'\n",
       "\\item 'RainTomorrow'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Date'\n",
       "2. 'Location'\n",
       "3. 'MinTemp'\n",
       "4. 'MaxTemp'\n",
       "5. 'Rainfall'\n",
       "6. 'Evaporation'\n",
       "7. 'Sunshine'\n",
       "8. 'WindGustDir'\n",
       "9. 'WindGustSpeed'\n",
       "10. 'WindDir9am'\n",
       "11. 'WindDir3pm'\n",
       "12. 'WindSpeed9am'\n",
       "13. 'WindSpeed3pm'\n",
       "14. 'Humidity9am'\n",
       "15. 'Humidity3pm'\n",
       "16. 'Pressure9am'\n",
       "17. 'Pressure3pm'\n",
       "18. 'Cloud9am'\n",
       "19. 'Cloud3pm'\n",
       "20. 'Temp9am'\n",
       "21. 'Temp3pm'\n",
       "22. 'RainToday'\n",
       "23. 'RainTomorrow'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Date\"          \"Location\"      \"MinTemp\"       \"MaxTemp\"      \n",
       " [5] \"Rainfall\"      \"Evaporation\"   \"Sunshine\"      \"WindGustDir\"  \n",
       " [9] \"WindGustSpeed\" \"WindDir9am\"    \"WindDir3pm\"    \"WindSpeed9am\" \n",
       "[13] \"WindSpeed3pm\"  \"Humidity9am\"   \"Humidity3pm\"   \"Pressure9am\"  \n",
       "[17] \"Pressure3pm\"   \"Cloud9am\"      \"Cloud3pm\"      \"Temp9am\"      \n",
       "[21] \"Temp3pm\"       \"RainToday\"     \"RainTomorrow\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "6bdea004",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:22.937591Z",
     "iopub.status.busy": "2023-02-21T11:47:22.936089Z",
     "iopub.status.idle": "2023-02-21T11:47:22.948301Z",
     "shell.execute_reply": "2023-02-21T11:47:22.946767Z"
    },
    "papermill": {
     "duration": 0.018684,
     "end_time": "2023-02-21T11:47:22.950545",
     "exception": false,
     "start_time": "2023-02-21T11:47:22.931861",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_numerical <- df[c('MinTemp','MaxTemp','Rainfall','Evaporation','Sunshine','WindGustSpeed','WindSpeed9am','WindSpeed3pm','Humidity9am','Humidity3pm',\n",
    " 'Pressure9am',\n",
    " 'Pressure3pm',\n",
    " 'Cloud9am',\n",
    " 'Cloud3pm',\n",
    " 'Temp9am',\n",
    " 'Temp3pm')]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "2efdec81",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:22.959033Z",
     "iopub.status.busy": "2023-02-21T11:47:22.957463Z",
     "iopub.status.idle": "2023-02-21T11:47:22.973201Z",
     "shell.execute_reply": "2023-02-21T11:47:22.971749Z"
    },
    "papermill": {
     "duration": 0.021853,
     "end_time": "2023-02-21T11:47:22.975146",
     "exception": false,
     "start_time": "2023-02-21T11:47:22.953293",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.4800976213392"
      ],
      "text/latex": [
       "0.4800976213392"
      ],
      "text/markdown": [
       "0.4800976213392"
      ],
      "text/plain": [
       "[1] 0.4800976"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "18591305",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:47:22.983633Z",
     "iopub.status.busy": "2023-02-21T11:47:22.982209Z",
     "iopub.status.idle": "2023-02-21T11:47:22.997571Z",
     "shell.execute_reply": "2023-02-21T11:47:22.995843Z"
    },
    "papermill": {
     "duration": 0.021677,
     "end_time": "2023-02-21T11:47:22.999583",
     "exception": false,
     "start_time": "2023-02-21T11:47:22.977906",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.431665062560154"
      ],
      "text/latex": [
       "0.431665062560154"
      ],
      "text/markdown": [
       "0.431665062560154"
      ],
      "text/plain": [
       "[1] 0.4316651"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e5c85245",
   "metadata": {
    "papermill": {
     "duration": 0.00258,
     "end_time": "2023-02-21T11:47:23.004901",
     "exception": false,
     "start_time": "2023-02-21T11:47:23.002321",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.232805,
   "end_time": "2023-02-21T11:47:23.129977",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-21T11:47:17.897172",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
