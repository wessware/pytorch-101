{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "75397a57",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:39.370218Z",
     "iopub.status.busy": "2023-02-21T11:54:39.367444Z",
     "iopub.status.idle": "2023-02-21T11:54:41.133409Z",
     "shell.execute_reply": "2023-02-21T11:54:41.129800Z"
    },
    "papermill": {
     "duration": 1.777247,
     "end_time": "2023-02-21T11:54:41.137402",
     "exception": false,
     "start_time": "2023-02-21T11:54:39.360155",
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
   "id": "0873fbf7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:41.177629Z",
     "iopub.status.busy": "2023-02-21T11:54:41.146284Z",
     "iopub.status.idle": "2023-02-21T11:54:41.543311Z",
     "shell.execute_reply": "2023-02-21T11:54:41.540952Z"
    },
    "papermill": {
     "duration": 0.40543,
     "end_time": "2023-02-21T11:54:41.546175",
     "exception": false,
     "start_time": "2023-02-21T11:54:41.140745",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘mice’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    cbind, rbind\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(mice)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "19015633",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:41.557689Z",
     "iopub.status.busy": "2023-02-21T11:54:41.555890Z",
     "iopub.status.idle": "2023-02-21T11:54:44.041790Z",
     "shell.execute_reply": "2023-02-21T11:54:44.039299Z"
    },
    "papermill": {
     "duration": 2.495336,
     "end_time": "2023-02-21T11:54:44.045196",
     "exception": false,
     "start_time": "2023-02-21T11:54:41.549860",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: colorspace\n",
      "\n",
      "Loading required package: grid\n",
      "\n",
      "VIM is ready to use.\n",
      "\n",
      "\n",
      "Suggestions and bug-reports can be submitted at: https://github.com/statistikat/VIM/issues\n",
      "\n",
      "\n",
      "Attaching package: ‘VIM’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:datasets’:\n",
      "\n",
      "    sleep\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(VIM)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "5f461414",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.061442Z",
     "iopub.status.busy": "2023-02-21T11:54:44.058948Z",
     "iopub.status.idle": "2023-02-21T11:54:44.118308Z",
     "shell.execute_reply": "2023-02-21T11:54:44.116072Z"
    },
    "papermill": {
     "duration": 0.071242,
     "end_time": "2023-02-21T11:54:44.122069",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.050827",
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
   "execution_count": 5,
   "id": "898db544",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.139185Z",
     "iopub.status.busy": "2023-02-21T11:54:44.137198Z",
     "iopub.status.idle": "2023-02-21T11:54:44.160824Z",
     "shell.execute_reply": "2023-02-21T11:54:44.158688Z"
    },
    "papermill": {
     "duration": 0.03565,
     "end_time": "2023-02-21T11:54:44.164058",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.128408",
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
   "execution_count": 6,
   "id": "a23b221c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.182881Z",
     "iopub.status.busy": "2023-02-21T11:54:44.180580Z",
     "iopub.status.idle": "2023-02-21T11:54:44.200409Z",
     "shell.execute_reply": "2023-02-21T11:54:44.198248Z"
    },
    "papermill": {
     "duration": 0.033136,
     "end_time": "2023-02-21T11:54:44.203951",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.170815",
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
   "execution_count": 7,
   "id": "03beada3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.217149Z",
     "iopub.status.busy": "2023-02-21T11:54:44.215361Z",
     "iopub.status.idle": "2023-02-21T11:54:44.239053Z",
     "shell.execute_reply": "2023-02-21T11:54:44.236319Z"
    },
    "papermill": {
     "duration": 0.034615,
     "end_time": "2023-02-21T11:54:44.243002",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.208387",
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
   "execution_count": 8,
   "id": "7045622a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.256440Z",
     "iopub.status.busy": "2023-02-21T11:54:44.254549Z",
     "iopub.status.idle": "2023-02-21T11:54:44.302464Z",
     "shell.execute_reply": "2023-02-21T11:54:44.299609Z"
    },
    "papermill": {
     "duration": 0.059529,
     "end_time": "2023-02-21T11:54:44.307064",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.247535",
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
   "execution_count": 9,
   "id": "c4996833",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.322820Z",
     "iopub.status.busy": "2023-02-21T11:54:44.320626Z",
     "iopub.status.idle": "2023-02-21T11:54:44.367002Z",
     "shell.execute_reply": "2023-02-21T11:54:44.364314Z"
    },
    "papermill": {
     "duration": 0.057566,
     "end_time": "2023-02-21T11:54:44.370382",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.312816",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>14.6</td><td>29.7</td><td>0.2</td><td>NA</td><td>NA</td><td>56</td><td>19</td><td>24</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>NA</td><td>NA</td><td>20.6</td><td>28.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 16\n",
       "\\begin{tabular}{r|llllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 13.4 & 22.9 & 0.6 & NA & NA & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8\\\\\n",
       "\t2 &  7.4 & 25.1 & 0.0 & NA & NA & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3\\\\\n",
       "\t3 & 12.9 & 25.7 & 0.0 & NA & NA & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2\\\\\n",
       "\t4 &  9.2 & 28.0 & 0.0 & NA & NA & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5\\\\\n",
       "\t5 & 17.5 & 32.3 & 1.0 & NA & NA & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7\\\\\n",
       "\t6 & 14.6 & 29.7 & 0.2 & NA & NA & 56 & 19 & 24 & 55 & 23 & 1009.2 & 1005.4 & NA & NA & 20.6 & 28.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 16\n",
       "\n",
       "| <!--/--> | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 13.4 | 22.9 | 0.6 | NA | NA | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 |\n",
       "| 2 |  7.4 | 25.1 | 0.0 | NA | NA | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 |\n",
       "| 3 | 12.9 | 25.7 | 0.0 | NA | NA | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 |\n",
       "| 4 |  9.2 | 28.0 | 0.0 | NA | NA | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 |\n",
       "| 5 | 17.5 | 32.3 | 1.0 | NA | NA | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 |\n",
       "| 6 | 14.6 | 29.7 | 0.2 | NA | NA | 56 | 19 | 24 | 55 | 23 | 1009.2 | 1005.4 | NA | NA | 20.6 | 28.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed WindSpeed9am\n",
       "1 13.4    22.9    0.6      NA          NA       44            20          \n",
       "2  7.4    25.1    0.0      NA          NA       44             4          \n",
       "3 12.9    25.7    0.0      NA          NA       46            19          \n",
       "4  9.2    28.0    0.0      NA          NA       24            11          \n",
       "5 17.5    32.3    1.0      NA          NA       41             7          \n",
       "6 14.6    29.7    0.2      NA          NA       56            19          \n",
       "  WindSpeed3pm Humidity9am Humidity3pm Pressure9am Pressure3pm Cloud9am\n",
       "1 24           71          22          1007.7      1007.1       8      \n",
       "2 22           44          25          1010.6      1007.8      NA      \n",
       "3 26           38          30          1007.6      1008.7      NA      \n",
       "4  9           45          16          1017.6      1012.8      NA      \n",
       "5 20           82          33          1010.8      1006.0       7      \n",
       "6 24           55          23          1009.2      1005.4      NA      \n",
       "  Cloud3pm Temp9am Temp3pm\n",
       "1 NA       16.9    21.8   \n",
       "2 NA       17.2    24.3   \n",
       "3  2       21.0    23.2   \n",
       "4 NA       18.1    26.5   \n",
       "5  8       17.8    29.7   \n",
       "6 NA       20.6    28.9   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "74f80bf3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T11:54:44.384170Z",
     "iopub.status.busy": "2023-02-21T11:54:44.382542Z",
     "iopub.status.idle": "2023-02-21T11:54:51.271392Z",
     "shell.execute_reply": "2023-02-21T11:54:51.268239Z"
    },
    "papermill": {
     "duration": 6.898896,
     "end_time": "2023-02-21T11:54:51.274605",
     "exception": false,
     "start_time": "2023-02-21T11:54:44.375709",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 658 × 17 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MaxTemp</th><th scope=col>MinTemp</th><th scope=col>WindSpeed9am</th><th scope=col>Temp9am</th><th scope=col>Humidity9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Rainfall</th><th scope=col>Temp3pm</th><th scope=col>Humidity3pm</th><th scope=col>WindGustSpeed</th><th scope=col>Pressure3pm</th><th scope=col>Pressure9am</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col></th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>58236</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5989</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>1977</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>7688</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>1458</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>684</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>288</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2467</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>209</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>440</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>211</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2618</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>5743</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2515</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>1228</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>28630</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>33</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    10</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    10</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>    1</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    1</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>51</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>63</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>187</th><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    16</td></tr>\n",
       "\t<tr><th scope=row></th><td>1261</td><td>1485</td><td>1767</td><td>1767</td><td>2654</td><td>3062</td><td>3261</td><td>3609</td><td>4507</td><td>10263</td><td>15028</td><td>15065</td><td>55888</td><td>59358</td><td>62790</td><td>69835</td><td>311600</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 658 × 17 of type dbl\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MaxTemp & MinTemp & WindSpeed9am & Temp9am & Humidity9am & WindSpeed3pm & Rainfall & Temp3pm & Humidity3pm & WindGustSpeed & Pressure3pm & Pressure9am & Cloud9am & Cloud3pm & Evaporation & Sunshine & \\\\\n",
       "\\hline\n",
       "\t58236 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0\\\\\n",
       "\t5989 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1\\\\\n",
       "\t1977 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1\\\\\n",
       "\t7688 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 2\\\\\n",
       "\t1458 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1\\\\\n",
       "\t684 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 2\\\\\n",
       "\t288 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 2\\\\\n",
       "\t2467 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 3\\\\\n",
       "\t209 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1\\\\\n",
       "\t440 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 2\\\\\n",
       "\t211 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 2\\\\\n",
       "\t2618 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 0 & 3\\\\\n",
       "\t5743 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 1 & 2\\\\\n",
       "\t2515 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 0 & 3\\\\\n",
       "\t1228 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 3\\\\\n",
       "\t28630 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 4\\\\\n",
       "\t33 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 1\\\\\n",
       "\t15 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 1 & 2\\\\\n",
       "\t21 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 0 & 3\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 1 & 2\\\\\n",
       "\t3 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 0 & 0 & 4\\\\\n",
       "\t4 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 0 & 0 & 4\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 4\\\\\n",
       "\t12 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 5\\\\\n",
       "\t18 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 1 & 1\\\\\n",
       "\t5 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 0 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 0 & 0 & 4\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 0 & 0 & 4\\\\\n",
       "\t⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t1 &    0 &    0 &    1 &    0 &    0 &    1 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 &    0 &    0 &    1 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     1 &     0 &     0 &     0 &     0 &     13\\\\\n",
       "\t1 &    0 &    0 &    0 &    1 &    1 &    0 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     1 &     0 &     10\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     1 &     0 &     0 &     0 &     0 &     1 &     10\\\\\n",
       "\t2 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     1 &     0 &     0 &     11\\\\\n",
       "\t2 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     11\\\\\n",
       "\t2 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     0 &     0 &     1 &     0 &     0 &     11\\\\\n",
       "\t12 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t10 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     13\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &    0 &     1 &     1 &     1 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     1 &     0 &     0 &     12\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     1 &     13\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     1 &     11\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     1 &     1 &     1 &     0 &     12\\\\\n",
       "\t3 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     1 &     14\\\\\n",
       "\t51 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     15\\\\\n",
       "\t3 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     15\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     1 &     12\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     0 &     13\\\\\n",
       "\t4 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     1 &     1 &     0 &     0 &     14\\\\\n",
       "\t63 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     1 &     1 &     14\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     1 &     0 &     15\\\\\n",
       "\t1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     1 &     15\\\\\n",
       "\t187 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     16\\\\\n",
       "\t & 1261 & 1485 & 1767 & 1767 & 2654 & 3062 & 3261 & 3609 & 4507 & 10263 & 15028 & 15065 & 55888 & 59358 & 62790 & 69835 & 311600\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 658 × 17 of type dbl\n",
       "\n",
       "| <!--/--> | MaxTemp | MinTemp | WindSpeed9am | Temp9am | Humidity9am | WindSpeed3pm | Rainfall | Temp3pm | Humidity3pm | WindGustSpeed | Pressure3pm | Pressure9am | Cloud9am | Cloud3pm | Evaporation | Sunshine | <!----> |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 58236 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 |\n",
       "| 5989 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 |\n",
       "| 1977 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 |\n",
       "| 7688 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 2 |\n",
       "| 1458 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |\n",
       "| 684 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 2 |\n",
       "| 288 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 2 |\n",
       "| 2467 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 3 |\n",
       "| 209 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 |\n",
       "| 440 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 2 |\n",
       "| 211 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 2 |\n",
       "| 2618 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 3 |\n",
       "| 5743 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 2 |\n",
       "| 2515 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 3 |\n",
       "| 1228 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 3 |\n",
       "| 28630 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 4 |\n",
       "| 33 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 |\n",
       "| 15 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 2 |\n",
       "| 21 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 3 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 | 2 |\n",
       "| 3 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 4 |\n",
       "| 4 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 4 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 4 |\n",
       "| 12 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 5 |\n",
       "| 18 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |\n",
       "| 5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 4 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 4 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 1 |    0 |    0 |    1 |    0 |    0 |    1 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 |    0 |    0 |    1 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     1 |     0 |     0 |     0 |     0 |     13 |\n",
       "| 1 |    0 |    0 |    0 |    1 |    1 |    0 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     1 |     0 |     10 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     1 |     0 |     0 |     0 |     0 |     1 |     10 |\n",
       "| 2 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     1 |     0 |     0 |     11 |\n",
       "| 2 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     11 |\n",
       "| 2 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     0 |     0 |     1 |     0 |     0 |     11 |\n",
       "| 12 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 10 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     13 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |    0 |     1 |     1 |     1 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     1 |     0 |     0 |     12 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     1 |     13 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     1 |     11 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     1 |     1 |     1 |     0 |     12 |\n",
       "| 3 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     1 |     14 |\n",
       "| 51 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     15 |\n",
       "| 3 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     15 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     1 |     12 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     0 |     13 |\n",
       "| 4 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     1 |     1 |     0 |     0 |     14 |\n",
       "| 63 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     1 |     1 |     14 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     1 |     0 |     15 |\n",
       "| 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     1 |     15 |\n",
       "| 187 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     16 |\n",
       "| <!----> | 1261 | 1485 | 1767 | 1767 | 2654 | 3062 | 3261 | 3609 | 4507 | 10263 | 15028 | 15065 | 55888 | 59358 | 62790 | 69835 | 311600 |\n",
       "\n"
      ],
      "text/plain": [
       "      MaxTemp MinTemp WindSpeed9am Temp9am Humidity9am WindSpeed3pm Rainfall\n",
       "58236 1       1       1            1       1           1            1       \n",
       "5989  1       1       1            1       1           1            1       \n",
       "1977  1       1       1            1       1           1            1       \n",
       "7688  1       1       1            1       1           1            1       \n",
       "1458  1       1       1            1       1           1            1       \n",
       "684   1       1       1            1       1           1            1       \n",
       "288   1       1       1            1       1           1            1       \n",
       "2467  1       1       1            1       1           1            1       \n",
       "209   1       1       1            1       1           1            1       \n",
       "440   1       1       1            1       1           1            1       \n",
       "211   1       1       1            1       1           1            1       \n",
       "2618  1       1       1            1       1           1            1       \n",
       "5743  1       1       1            1       1           1            1       \n",
       "2515  1       1       1            1       1           1            1       \n",
       "1228  1       1       1            1       1           1            1       \n",
       "28630 1       1       1            1       1           1            1       \n",
       "33    1       1       1            1       1           1            1       \n",
       "15    1       1       1            1       1           1            1       \n",
       "2     1       1       1            1       1           1            1       \n",
       "21    1       1       1            1       1           1            1       \n",
       "1     1       1       1            1       1           1            1       \n",
       "3     1       1       1            1       1           1            1       \n",
       "4     1       1       1            1       1           1            1       \n",
       "1     1       1       1            1       1           1            1       \n",
       "12    1       1       1            1       1           1            1       \n",
       "18    1       1       1            1       1           1            1       \n",
       "5     1       1       1            1       1           1            1       \n",
       "2     1       1       1            1       1           1            1       \n",
       "2     1       1       1            1       1           1            1       \n",
       "1     1       1       1            1       1           1            1       \n",
       "⋮     ⋮       ⋮       ⋮            ⋮       ⋮           ⋮            ⋮       \n",
       "1        0       0       1            0       0           1            0    \n",
       "1        0       0       1            0       0           0            1    \n",
       "1        0       0       0            1       1           0            1    \n",
       "1        0       0       0            0       0           1            1    \n",
       "2        0       0       0            0       0           1            1    \n",
       "2        0       0       0            0       0           1            1    \n",
       "1        0       0       0            0       0           1            0    \n",
       "1        0       0       0            0       0           1            0    \n",
       "2        0       0       0            0       0           1            0    \n",
       "12       0       0       0            0       0           1            0    \n",
       "10       0       0       0            0       0           1            0    \n",
       "1        0       0       0            0       0           1            0    \n",
       "1        0       0       0            0       0           0            1    \n",
       "1        0       0       0            0       0           0            1    \n",
       "1        0       0       0            0       0           0            1    \n",
       "1        0       0       0            0       0           0            1    \n",
       "1        0       0       0            0       0           0            1    \n",
       "3        0       0       0            0       0           0            1    \n",
       "51       0       0       0            0       0           0            1    \n",
       "3        0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "4        0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "63       0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "1        0       0       0            0       0           0            0    \n",
       "187      0       0       0            0       0           0            0    \n",
       "      1261    1485    1767         1767    2654        3062         3261    \n",
       "      Temp3pm Humidity3pm WindGustSpeed Pressure3pm Pressure9am Cloud9am\n",
       "58236 1       1           1             1           1           1       \n",
       "5989  1       1           1             1           1           1       \n",
       "1977  1       1           1             1           1           1       \n",
       "7688  1       1           1             1           1           1       \n",
       "1458  1       1           1             1           1           1       \n",
       "684   1       1           1             1           1           1       \n",
       "288   1       1           1             1           1           1       \n",
       "2467  1       1           1             1           1           1       \n",
       "209   1       1           1             1           1           0       \n",
       "440   1       1           1             1           1           0       \n",
       "211   1       1           1             1           1           0       \n",
       "2618  1       1           1             1           1           0       \n",
       "5743  1       1           1             1           1           0       \n",
       "2515  1       1           1             1           1           0       \n",
       "1228  1       1           1             1           1           0       \n",
       "28630 1       1           1             1           1           0       \n",
       "33    1       1           1             1           0           1       \n",
       "15    1       1           1             1           0           1       \n",
       "2     1       1           1             1           0           1       \n",
       "21    1       1           1             1           0           1       \n",
       "1     1       1           1             1           0           1       \n",
       "3     1       1           1             1           0           1       \n",
       "4     1       1           1             1           0           0       \n",
       "1     1       1           1             1           0           0       \n",
       "12    1       1           1             1           0           0       \n",
       "18    1       1           1             0           1           1       \n",
       "5     1       1           1             0           1           1       \n",
       "2     1       1           1             0           1           1       \n",
       "2     1       1           1             0           1           1       \n",
       "1     1       1           1             0           1           0       \n",
       "⋮     ⋮       ⋮           ⋮             ⋮           ⋮           ⋮       \n",
       "1        0       0            0             1           1           0   \n",
       "1        0       0            0             0           1           0   \n",
       "1        1       1            0             0           0           0   \n",
       "1        1       1            0             1           0           0   \n",
       "2        1       1            0             0           0           0   \n",
       "2        1       1            0             0           0           0   \n",
       "1        1       1            1             0           0           0   \n",
       "1        1       1            0             1           1           0   \n",
       "2        1       1            0             1           0           0   \n",
       "12       1       1            0             1           0           0   \n",
       "10       1       1            0             0           0           0   \n",
       "1        0       0            1             1           1           0   \n",
       "1        1       1            0             0           0           0   \n",
       "1        0       0            1             0           0           0   \n",
       "1        0       0            1             0           0           0   \n",
       "1        0       0            0             1           1           0   \n",
       "1        0       0            0             0           0           1   \n",
       "3        0       0            0             0           0           0   \n",
       "51       0       0            0             0           0           0   \n",
       "3        1       1            0             0           0           0   \n",
       "1        0       0            1             0           0           0   \n",
       "1        0       0            0             1           1           0   \n",
       "1        0       0            0             1           1           0   \n",
       "4        0       0            0             1           1           0   \n",
       "1        0       0            0             0           0           1   \n",
       "63       0       0            0             0           0           0   \n",
       "1        0       0            0             0           0           0   \n",
       "1        0       0            0             0           0           0   \n",
       "187      0       0            0             0           0           0   \n",
       "      3609    4507        10263         15028       15065       55888   \n",
       "      Cloud3pm Evaporation Sunshine       \n",
       "58236 1        1           1        0     \n",
       "5989  1        1           0        1     \n",
       "1977  1        0           1        1     \n",
       "7688  1        0           0        2     \n",
       "1458  0        1           1        1     \n",
       "684   0        1           0        2     \n",
       "288   0        0           1        2     \n",
       "2467  0        0           0        3     \n",
       "209   1        1           1        1     \n",
       "440   1        1           0        2     \n",
       "211   1        0           1        2     \n",
       "2618  1        0           0        3     \n",
       "5743  0        1           1        2     \n",
       "2515  0        1           0        3     \n",
       "1228  0        0           1        3     \n",
       "28630 0        0           0        4     \n",
       "33    1        1           1        1     \n",
       "15    1        1           0        2     \n",
       "2     1        0           1        2     \n",
       "21    1        0           0        3     \n",
       "1     0        1           1        2     \n",
       "3     0        0           0        4     \n",
       "4     1        0           0        4     \n",
       "1     0        1           0        4     \n",
       "12    0        0           0        5     \n",
       "18    1        1           1        1     \n",
       "5     1        1           0        2     \n",
       "2     0        1           1        2     \n",
       "2     0        0           0        4     \n",
       "1     1        0           0        4     \n",
       "⋮     ⋮        ⋮           ⋮        ⋮     \n",
       "1         0        0           0        12\n",
       "1         0        0           0        13\n",
       "1         0        1           0        10\n",
       "1         0        0           1        10\n",
       "2         1        0           0        11\n",
       "2         0        0           0        12\n",
       "1         0        0           0        12\n",
       "1         0        0           0        11\n",
       "2         1        0           0        11\n",
       "12        0        0           0        12\n",
       "10        0        0           0        13\n",
       "1         0        0           0        12\n",
       "1         1        0           0        12\n",
       "1         0        0           1        13\n",
       "1         0        0           0        14\n",
       "1         0        1           1        11\n",
       "1         1        1           0        12\n",
       "3         0        0           1        14\n",
       "51        0        0           0        15\n",
       "3         0        0           0        14\n",
       "1         0        0           0        15\n",
       "1         0        1           1        12\n",
       "1         0        1           0        13\n",
       "4         0        0           0        14\n",
       "1         1        0           0        14\n",
       "63        0        1           1        14\n",
       "1         0        1           0        15\n",
       "1         0        0           1        15\n",
       "187       0        0           0        16\n",
       "      59358    62790       69835    311600"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nSqrmJ45RAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "md.pattern(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "8f5066e2",
   "metadata": {
    "papermill": {
     "duration": 0.007095,
     "end_time": "2023-02-21T11:54:51.289521",
     "exception": false,
     "start_time": "2023-02-21T11:54:51.282426",
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
   "duration": 16.234945,
   "end_time": "2023-02-21T11:54:51.421703",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-21T11:54:35.186758",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
