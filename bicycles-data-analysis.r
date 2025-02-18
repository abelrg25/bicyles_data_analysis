{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "d4bf7245",
   "metadata": {
    "papermill": {
     "duration": 0.005517,
     "end_time": "2025-02-18T18:18:19.490797",
     "exception": false,
     "start_time": "2025-02-18T18:18:19.485280",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Caso práctico No. 1: La empresa Cyclistic\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1d8aeb15",
   "metadata": {
    "papermill": {
     "duration": 0.004434,
     "end_time": "2025-02-18T18:18:19.499887",
     "exception": false,
     "start_time": "2025-02-18T18:18:19.495453",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Este ejercicio corresponde al análisis de datos de la empresa cyclistic para extraer información y tendencias que nos permitan incrementar el número de suscriptores anuales que son quienes llevarán al éxito de la empresa. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "676dcca1",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:19.513448Z",
     "iopub.status.busy": "2025-02-18T18:18:19.511819Z",
     "iopub.status.idle": "2025-02-18T18:18:21.152698Z",
     "shell.execute_reply": "2025-02-18T18:18:21.151592Z"
    },
    "papermill": {
     "duration": 1.649092,
     "end_time": "2025-02-18T18:18:21.154515",
     "exception": false,
     "start_time": "2025-02-18T18:18:19.505423",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'/kaggle/working'"
      ],
      "text/latex": [
       "'/kaggle/working'"
      ],
      "text/markdown": [
       "'/kaggle/working'"
      ],
      "text/plain": [
       "[1] \"/kaggle/working\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Importación de las librerias de análisis\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(ggplot2)\n",
    "library(lubridate)\n",
    "library(skimr)\n",
    "getwd()\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "# list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a8832979",
   "metadata": {
    "papermill": {
     "duration": 0.005084,
     "end_time": "2025-02-18T18:18:21.165155",
     "exception": false,
     "start_time": "2025-02-18T18:18:21.160071",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Caso práctico No. 1: La empresa Cyclistic\n",
    "Este ejercicio corresponde al análisis de datos de la empresa cyclistic para \n",
    "extraer información y tendencias que nos permitan incrementar el número de \n",
    "suscriptores anuales. Nuestra directora de marketing asegura que la empresa \n",
    "tendrá éxito si maximizamos el número de suscripciones anuales. \n",
    "\n",
    "# Pregunta empresarial \n",
    "En esta fase se define el objetivo empresarial y la pregunta que queremos \n",
    "responder con datos. Para este caso la pregunta a responder es __¿En qué se \n",
    "diferencian los socios anuales y los ciclistas ocasionales con respecto al uso \n",
    "de las bicicletas de Cyclistic?__ \n",
    "\n",
    "Para responder la pregunta empresarial vamos a analizar \n",
    "datos que la empresa (ficticia) Cyclistic puso a nuestra disposición. Estos son \n",
    "datos de primera fuente ya que son recabados y almacenados por la empresa.\n",
    "Los datos que vamos a analizar corresponden al año 2024 y se encuentran organizados por \n",
    "mes. A continuación podemos ver los archivos de datos: "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "c2ce0f27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:21.198092Z",
     "iopub.status.busy": "2025-02-18T18:18:21.176587Z",
     "iopub.status.idle": "2025-02-18T18:18:21.217211Z",
     "shell.execute_reply": "2025-02-18T18:18:21.216004Z"
    },
    "papermill": {
     "duration": 0.048658,
     "end_time": "2025-02-18T18:18:21.218699",
     "exception": false,
     "start_time": "2025-02-18T18:18:21.170041",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'202403-divvy-tripdata.csv'"
      ],
      "text/latex": [
       "'202403-divvy-tripdata.csv'"
      ],
      "text/markdown": [
       "'202403-divvy-tripdata.csv'"
      ],
      "text/plain": [
       "[1] \"202403-divvy-tripdata.csv\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "input_dir = \"../input/bike-share-2024-data-analysis/\"\n",
    "dir1 = \"202403-divvy-tripdata\"\n",
    "list.files(path=paste(input_dir,dir1, sep=\"\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70bf0a0a",
   "metadata": {
    "papermill": {
     "duration": 0.004811,
     "end_time": "2025-02-18T18:18:21.228646",
     "exception": false,
     "start_time": "2025-02-18T18:18:21.223835",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Limpieza de los datos "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f8adbb4f",
   "metadata": {
    "papermill": {
     "duration": 0.004659,
     "end_time": "2025-02-18T18:18:21.238446",
     "exception": false,
     "start_time": "2025-02-18T18:18:21.233787",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Lo siguiente es leer todos los datos y almacenarlos en variables:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d95ed800",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:21.250916Z",
     "iopub.status.busy": "2025-02-18T18:18:21.249720Z",
     "iopub.status.idle": "2025-02-18T18:18:47.125952Z",
     "shell.execute_reply": "2025-02-18T18:18:47.124510Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 25.884427,
     "end_time": "2025-02-18T18:18:47.127679",
     "exception": false,
     "start_time": "2025-02-18T18:18:21.243252",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m144873\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m223164\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m301687\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m415025\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m609493\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m710721\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m748962\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m755639\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m821276\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m616281\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m335075\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m178372\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "trips_2024_01 <- read_csv(paste(input_dir,\"202401-divvy-tripdata/202401-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_02 <- read_csv(paste(input_dir,\"202402-divvy-tripdata/202402-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_03 <- read_csv(paste(input_dir,\"202403-divvy-tripdata/202403-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_04 <- read_csv(paste(input_dir,\"202404-divvy-tripdata/202404-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_05 <- read_csv(paste(input_dir,\"202405-divvy-tripdata/202405-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_06 <- read_csv(paste(input_dir,\"202406-divvy-tripdata/202406-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_07 <- read_csv(paste(input_dir,\"202407-divvy-tripdata/202407-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_08 <- read_csv(paste(input_dir,\"202408-divvy-tripdata/202408-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_09 <- read_csv(paste(input_dir,\"202409-divvy-tripdata/202409-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_10 <- read_csv(paste(input_dir,\"202410-divvy-tripdata/202410-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_11 <- read_csv(paste(input_dir,\"202411-divvy-tripdata/202411-divvy-tripdata.csv\", sep=\"\"))\n",
    "trips_2024_12 <- read_csv(paste(input_dir,\"202412-divvy-tripdata/202412-divvy-tripdata.csv\", sep=\"\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3e213913",
   "metadata": {
    "papermill": {
     "duration": 0.006498,
     "end_time": "2025-02-18T18:18:47.141134",
     "exception": false,
     "start_time": "2025-02-18T18:18:47.134636",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Para poder unir los dataframes tenemos que verificar que todos tengan las mismas\n",
    "columnas. Hacemos esto con `colnames()`"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b5c3147d",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:47.158788Z",
     "iopub.status.busy": "2025-02-18T18:18:47.157271Z",
     "iopub.status.idle": "2025-02-18T18:18:47.227705Z",
     "shell.execute_reply": "2025-02-18T18:18:47.226152Z"
    },
    "papermill": {
     "duration": 0.081958,
     "end_time": "2025-02-18T18:18:47.229675",
     "exception": false,
     "start_time": "2025-02-18T18:18:47.147717",
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
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(trips_2024_01)\n",
    "colnames(trips_2024_02)\n",
    "colnames(trips_2024_03)\n",
    "colnames(trips_2024_04)\n",
    "colnames(trips_2024_05)\n",
    "colnames(trips_2024_06)\n",
    "colnames(trips_2024_07)\n",
    "colnames(trips_2024_08)\n",
    "colnames(trips_2024_09)\n",
    "colnames(trips_2024_10)\n",
    "colnames(trips_2024_11)\n",
    "colnames(trips_2024_12)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1b627563",
   "metadata": {
    "papermill": {
     "duration": 0.007617,
     "end_time": "2025-02-18T18:18:47.245397",
     "exception": false,
     "start_time": "2025-02-18T18:18:47.237780",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Ahora juntamos todas las tablas en una sola con `bind_rows` y realizamos una primera inspección de todos los datos juntos con `skimr`:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "139a17d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:47.264261Z",
     "iopub.status.busy": "2025-02-18T18:18:47.262728Z",
     "iopub.status.idle": "2025-02-18T18:18:50.971551Z",
     "shell.execute_reply": "2025-02-18T18:18:50.970215Z"
    },
    "papermill": {
     "duration": 3.720362,
     "end_time": "2025-02-18T18:18:50.973470",
     "exception": false,
     "start_time": "2025-02-18T18:18:47.253108",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips_2024 <- bind_rows(trips_2024_01, trips_2024_02, trips_2024_03, \n",
    "                            trips_2024_04, trips_2024_05, trips_2024_06, \n",
    "                            trips_2024_07, trips_2024_08, trips_2024_09, \n",
    "                            trips_2024_10, trips_2024_11, trips_2024_12)\n",
    "\n",
    "#skim_without_charts(all_trips_2024)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7e972cfc",
   "metadata": {
    "papermill": {
     "duration": 0.00789,
     "end_time": "2025-02-18T18:18:50.989537",
     "exception": false,
     "start_time": "2025-02-18T18:18:50.981647",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "En este dataframe hay alrededor de un millon de datos a los que les hace falta \n",
    "tanto el nombre como el id de la estación de inicio y de fin del viaje. Ya que \n",
    "no tenemos manera de saber como rellenar estos datos tenemos 2 opciones:\n",
    "1. Podemos remover los valores faltantes ya que no disponemos la información \n",
    "necesaria para complementarlos\n",
    "2. Podríamos relacionar la latitud y longitud de inicio y fin con el ID y nombre \n",
    "de estación, esto porque los datos de latitud y longitud faltantes son alrededor \n",
    "de 7000. Para poder relacionar este procedimiento tendríamos que hacer un match \n",
    "perfecto de latitudes y longitudes. \n",
    "\n",
    "Para este caso vamos simplemente a remover las filas que tienen datos faltantes.\n",
    "Esto nos deja con alrededor de 4 millones de datos que aun son suficientes para \n",
    "responder a la pregunta inicial. En una situación real lo ideal sería preguntar \n",
    "a nuestro responsable superior la manera en la que tratariamos los datos \n",
    "faltantes."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "ded9f279",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:51.012128Z",
     "iopub.status.busy": "2025-02-18T18:18:51.010891Z",
     "iopub.status.idle": "2025-02-18T18:18:56.333738Z",
     "shell.execute_reply": "2025-02-18T18:18:56.332587Z"
    },
    "papermill": {
     "duration": 5.338034,
     "end_time": "2025-02-18T18:18:56.335452",
     "exception": false,
     "start_time": "2025-02-18T18:18:50.997418",
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
       "<ol class=list-inline><li>4208309</li><li>13</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 4208309\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 4208309\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 4208309      13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [4,208,309 × 13] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:4208309] \"C1D650626C8C899A\" \"EECD38BDB25BFCB0\" \"F4A9CE78061F17F7\" \"0A0D9E15EE50B171\" ...\n",
      " $ rideable_type     : chr [1:4208309] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:4208309], format: \"2024-01-12 15:30:27\" \"2024-01-08 15:45:46\" ...\n",
      " $ ended_at          : POSIXct[1:4208309], format: \"2024-01-12 15:37:59\" \"2024-01-08 15:52:59\" ...\n",
      " $ start_station_name: chr [1:4208309] \"Wells St & Elm St\" \"Wells St & Elm St\" \"Wells St & Elm St\" \"Wells St & Randolph St\" ...\n",
      " $ start_station_id  : chr [1:4208309] \"KA1504000135\" \"KA1504000135\" \"KA1504000135\" \"TA1305000030\" ...\n",
      " $ end_station_name  : chr [1:4208309] \"Kingsbury St & Kinzie St\" \"Kingsbury St & Kinzie St\" \"Kingsbury St & Kinzie St\" \"Larrabee St & Webster Ave\" ...\n",
      " $ end_station_id    : chr [1:4208309] \"KA1503000043\" \"KA1503000043\" \"KA1503000043\" \"13193\" ...\n",
      " $ start_lat         : num [1:4208309] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:4208309] -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ end_lat           : num [1:4208309] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:4208309] -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ member_casual     : chr [1:4208309] \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                    \n",
       " Length:4208309     Length:4208309     Min.   :2024-01-01 00:01:01.00  \n",
       " Class :character   Class :character   1st Qu.:2024-05-18 07:55:28.00  \n",
       " Mode  :character   Mode  :character   Median :2024-07-20 20:26:32.30  \n",
       "                                       Mean   :2024-07-15 06:53:24.81  \n",
       "                                       3rd Qu.:2024-09-17 14:39:35.17  \n",
       "                                       Max.   :2024-12-31 23:56:49.84  \n",
       "    ended_at                      start_station_name start_station_id  \n",
       " Min.   :2024-01-01 00:07:01.00   Length:4208309     Length:4208309    \n",
       " 1st Qu.:2024-05-18 08:12:56.00   Class :character   Class :character  \n",
       " Median :2024-07-20 20:48:15.22   Mode  :character   Mode  :character  \n",
       " Mean   :2024-07-15 07:10:04.30                                        \n",
       " 3rd Qu.:2024-09-17 14:58:24.06                                        \n",
       " Max.   :2024-12-31 23:59:28.81                                        \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:4208309     Length:4208309     Min.   :41.65   Min.   :-87.86  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.89   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.64  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :42.06   Max.   :-87.53  \n",
       "    end_lat         end_lng       member_casual     \n",
       " Min.   :41.65   Min.   :-87.84   Length:4208309    \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character  \n",
       " Median :41.89   Median :-87.64   Mode  :character  \n",
       " Mean   :41.90   Mean   :-87.64                     \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                     \n",
       " Max.   :42.06   Max.   :-87.53                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_2024_cleaned <- drop_na(all_trips_2024)\n",
    "dim(all_trips_2024_cleaned)\n",
    "str(all_trips_2024_cleaned)\n",
    "summary(all_trips_2024_cleaned)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "19fe15b1",
   "metadata": {
    "papermill": {
     "duration": 0.007746,
     "end_time": "2025-02-18T18:18:56.351467",
     "exception": false,
     "start_time": "2025-02-18T18:18:56.343721",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "En este punto vamos a dejar fuera las columnas `start_lat`, `start_lng`, `end_lat`, `end_lng`, ya que no nos sirven para el análisis. Además, para tener un mejor control sobre las fechas de inicio y fin de los viajes vamos a agregar nuevas columnas con dia, mes, año y dia de la semana para cada fecha. Es indispensable también agregar una columna donde se incluya la duración de cada viaje pues haremos nuestro análisis con esta información. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "c8e28505",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:18:56.370131Z",
     "iopub.status.busy": "2025-02-18T18:18:56.368895Z",
     "iopub.status.idle": "2025-02-18T18:19:03.542531Z",
     "shell.execute_reply": "2025-02-18T18:19:03.540956Z"
    },
    "papermill": {
     "duration": 7.184903,
     "end_time": "2025-02-18T18:19:03.544131",
     "exception": false,
     "start_time": "2025-02-18T18:18:56.359228",
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
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       "[4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       "[7] \"end_station_name\"   \"end_station_id\"     \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>day_of_week</th><th scope=col>trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C1D650626C8C899A</td><td>electric_bike</td><td>2024-01-12 15:30:27</td><td>2024-01-12 15:37:59</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-12</td><td>2024</td><td>01</td><td>12</td><td><span style=white-space:pre-wrap>Friday   </span></td><td> 8</td></tr>\n",
       "\t<tr><td>EECD38BDB25BFCB0</td><td>electric_bike</td><td>2024-01-08 15:45:46</td><td>2024-01-08 15:52:59</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-08</td><td>2024</td><td>01</td><td>08</td><td><span style=white-space:pre-wrap>Monday   </span></td><td> 7</td></tr>\n",
       "\t<tr><td>F4A9CE78061F17F7</td><td>electric_bike</td><td>2024-01-27 12:27:19</td><td>2024-01-27 12:35:19</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-27</td><td>2024</td><td>01</td><td>27</td><td>Saturday </td><td> 8</td></tr>\n",
       "\t<tr><td>0A0D9E15EE50B171</td><td>classic_bike </td><td>2024-01-29 16:26:17</td><td>2024-01-29 16:56:06</td><td><span style=white-space:pre-wrap>Wells St &amp; Randolph St    </span></td><td>TA1305000030</td><td>Larrabee St &amp; Webster Ave</td><td><span style=white-space:pre-wrap>13193       </span></td><td>member</td><td>2024-01-29</td><td>2024</td><td>01</td><td>29</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>30</td></tr>\n",
       "\t<tr><td>33FFC9805E3EFF9A</td><td>classic_bike </td><td>2024-01-31 05:43:23</td><td>2024-01-31 06:09:35</td><td>Lincoln Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13253       </span></td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-31</td><td>2024</td><td>01</td><td>31</td><td>Wednesday</td><td>26</td></tr>\n",
       "\t<tr><td>C96080812CD285C5</td><td>classic_bike </td><td>2024-01-07 11:21:24</td><td>2024-01-07 11:30:03</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-07</td><td>2024</td><td>01</td><td>07</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td> 9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & member\\_casual & date & year & month & day & day\\_of\\_week & trip\\_duration\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <chr> & <date> & <chr> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t C1D650626C8C899A & electric\\_bike & 2024-01-12 15:30:27 & 2024-01-12 15:37:59 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-12 & 2024 & 01 & 12 & Friday    &  8\\\\\n",
       "\t EECD38BDB25BFCB0 & electric\\_bike & 2024-01-08 15:45:46 & 2024-01-08 15:52:59 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-08 & 2024 & 01 & 08 & Monday    &  7\\\\\n",
       "\t F4A9CE78061F17F7 & electric\\_bike & 2024-01-27 12:27:19 & 2024-01-27 12:35:19 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-27 & 2024 & 01 & 27 & Saturday  &  8\\\\\n",
       "\t 0A0D9E15EE50B171 & classic\\_bike  & 2024-01-29 16:26:17 & 2024-01-29 16:56:06 & Wells St \\& Randolph St     & TA1305000030 & Larrabee St \\& Webster Ave & 13193        & member & 2024-01-29 & 2024 & 01 & 29 & Monday    & 30\\\\\n",
       "\t 33FFC9805E3EFF9A & classic\\_bike  & 2024-01-31 05:43:23 & 2024-01-31 06:09:35 & Lincoln Ave \\& Waveland Ave & 13253        & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-31 & 2024 & 01 & 31 & Wednesday & 26\\\\\n",
       "\t C96080812CD285C5 & classic\\_bike  & 2024-01-07 11:21:24 & 2024-01-07 11:30:03 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-07 & 2024 & 01 & 07 & Sunday    &  9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | year &lt;chr&gt; | month &lt;chr&gt; | day &lt;chr&gt; | day_of_week &lt;chr&gt; | trip_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| C1D650626C8C899A | electric_bike | 2024-01-12 15:30:27 | 2024-01-12 15:37:59 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-12 | 2024 | 01 | 12 | Friday    |  8 |\n",
       "| EECD38BDB25BFCB0 | electric_bike | 2024-01-08 15:45:46 | 2024-01-08 15:52:59 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-08 | 2024 | 01 | 08 | Monday    |  7 |\n",
       "| F4A9CE78061F17F7 | electric_bike | 2024-01-27 12:27:19 | 2024-01-27 12:35:19 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-27 | 2024 | 01 | 27 | Saturday  |  8 |\n",
       "| 0A0D9E15EE50B171 | classic_bike  | 2024-01-29 16:26:17 | 2024-01-29 16:56:06 | Wells St &amp; Randolph St     | TA1305000030 | Larrabee St &amp; Webster Ave | 13193        | member | 2024-01-29 | 2024 | 01 | 29 | Monday    | 30 |\n",
       "| 33FFC9805E3EFF9A | classic_bike  | 2024-01-31 05:43:23 | 2024-01-31 06:09:35 | Lincoln Ave &amp; Waveland Ave | 13253        | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-31 | 2024 | 01 | 31 | Wednesday | 26 |\n",
       "| C96080812CD285C5 | classic_bike  | 2024-01-07 11:21:24 | 2024-01-07 11:30:03 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-07 | 2024 | 01 | 07 | Sunday    |  9 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C1D650626C8C899A electric_bike 2024-01-12 15:30:27 2024-01-12 15:37:59\n",
       "2 EECD38BDB25BFCB0 electric_bike 2024-01-08 15:45:46 2024-01-08 15:52:59\n",
       "3 F4A9CE78061F17F7 electric_bike 2024-01-27 12:27:19 2024-01-27 12:35:19\n",
       "4 0A0D9E15EE50B171 classic_bike  2024-01-29 16:26:17 2024-01-29 16:56:06\n",
       "5 33FFC9805E3EFF9A classic_bike  2024-01-31 05:43:23 2024-01-31 06:09:35\n",
       "6 C96080812CD285C5 classic_bike  2024-01-07 11:21:24 2024-01-07 11:30:03\n",
       "  start_station_name         start_station_id end_station_name         \n",
       "1 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "2 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "3 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "4 Wells St & Randolph St     TA1305000030     Larrabee St & Webster Ave\n",
       "5 Lincoln Ave & Waveland Ave 13253            Kingsbury St & Kinzie St \n",
       "6 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "  end_station_id member_casual date       year month day day_of_week\n",
       "1 KA1503000043   member        2024-01-12 2024 01    12  Friday     \n",
       "2 KA1503000043   member        2024-01-08 2024 01    08  Monday     \n",
       "3 KA1503000043   member        2024-01-27 2024 01    27  Saturday   \n",
       "4 13193          member        2024-01-29 2024 01    29  Monday     \n",
       "5 KA1503000043   member        2024-01-31 2024 01    31  Wednesday  \n",
       "6 KA1503000043   member        2024-01-07 2024 01    07  Sunday     \n",
       "  trip_duration\n",
       "1  8           \n",
       "2  7           \n",
       "3  8           \n",
       "4 30           \n",
       "5 26           \n",
       "6  9           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [4,208,309 × 15] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:4208309] \"C1D650626C8C899A\" \"EECD38BDB25BFCB0\" \"F4A9CE78061F17F7\" \"0A0D9E15EE50B171\" ...\n",
      " $ rideable_type     : chr [1:4208309] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:4208309], format: \"2024-01-12 15:30:27\" \"2024-01-08 15:45:46\" ...\n",
      " $ ended_at          : POSIXct[1:4208309], format: \"2024-01-12 15:37:59\" \"2024-01-08 15:52:59\" ...\n",
      " $ start_station_name: chr [1:4208309] \"Wells St & Elm St\" \"Wells St & Elm St\" \"Wells St & Elm St\" \"Wells St & Randolph St\" ...\n",
      " $ start_station_id  : chr [1:4208309] \"KA1504000135\" \"KA1504000135\" \"KA1504000135\" \"TA1305000030\" ...\n",
      " $ end_station_name  : chr [1:4208309] \"Kingsbury St & Kinzie St\" \"Kingsbury St & Kinzie St\" \"Kingsbury St & Kinzie St\" \"Larrabee St & Webster Ave\" ...\n",
      " $ end_station_id    : chr [1:4208309] \"KA1503000043\" \"KA1503000043\" \"KA1503000043\" \"13193\" ...\n",
      " $ member_casual     : chr [1:4208309] \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ date              : Date[1:4208309], format: \"2024-01-12\" \"2024-01-08\" ...\n",
      " $ year              : chr [1:4208309] \"2024\" \"2024\" \"2024\" \"2024\" ...\n",
      " $ month             : chr [1:4208309] \"01\" \"01\" \"01\" \"01\" ...\n",
      " $ day               : chr [1:4208309] \"12\" \"08\" \"27\" \"29\" ...\n",
      " $ day_of_week       : chr [1:4208309] \"Friday\" \"Monday\" \"Saturday\" \"Monday\" ...\n",
      " $ trip_duration     : num [1:4208309] 8 7 8 30 26 9 9 8 10 9 ...\n"
     ]
    }
   ],
   "source": [
    "##removemos las columnas que no nos sirven para el análisis\n",
    "all_trips_2024_cleaned <- all_trips_2024_cleaned %>% \n",
    "  select(-c(start_lat, start_lng, end_lat, end_lng))\n",
    "colnames(all_trips_2024_cleaned)\n",
    "\n",
    "## Insertamos las columnas nuevas \n",
    "all_trips_2024_cleaned$date <- as.Date(all_trips_2024_cleaned$started_at)\n",
    "all_trips_2024_cleaned$year <- format(as.Date(all_trips_2024_cleaned$date), \"%Y\")\n",
    "all_trips_2024_cleaned$month <- format(as.Date(all_trips_2024_cleaned$date), \"%m\")\n",
    "all_trips_2024_cleaned$day <- format(as.Date(all_trips_2024_cleaned$date), \"%d\")\n",
    "all_trips_2024_cleaned$day_of_week <- format(as.Date(all_trips_2024_cleaned$date), \"%A\")\n",
    "all_trips_2024_cleaned$trip_duration <- round(difftime(all_trips_2024_cleaned$ended_at, \n",
    "                                                 all_trips_2024_cleaned$started_at, units = \"mins\"), digits=0)\n",
    "\n",
    "# Para poder trabajar con la columna trip_duration necesitamos convertirla a valor numérico ya que se encuentra en formato difftime\n",
    "all_trips_2024_cleaned$trip_duration <- as.numeric(all_trips_2024_cleaned$trip_duration)\n",
    "\n",
    "#Verificamos la nueva tabla\n",
    "head(all_trips_2024_cleaned)\n",
    "str(all_trips_2024_cleaned)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "76d29a9c",
   "metadata": {
    "papermill": {
     "duration": 0.008227,
     "end_time": "2025-02-18T18:19:03.560993",
     "exception": false,
     "start_time": "2025-02-18T18:19:03.552766",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Dado que trabajaremos principalmente con la duración de los viajes (`trip_duration`), es importante conocer la distribución de valores e identificar posibles valores extremos o \"outliers\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "1ff81afa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:03.581077Z",
     "iopub.status.busy": "2025-02-18T18:19:03.579815Z",
     "iopub.status.idle": "2025-02-18T18:19:03.734385Z",
     "shell.execute_reply": "2025-02-18T18:19:03.733121Z"
    },
    "papermill": {
     "duration": 0.166902,
     "end_time": "2025-02-18T18:19:03.736117",
     "exception": false,
     "start_time": "2025-02-18T18:19:03.569215",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       " -55.00    6.00   10.00   16.66   18.00 1509.00 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips_2024_cleaned$trip_duration)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "26cece09",
   "metadata": {
    "papermill": {
     "duration": 0.008325,
     "end_time": "2025-02-18T18:19:03.753798",
     "exception": false,
     "start_time": "2025-02-18T18:19:03.745473",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "De este análisis notamos que existen duraciones negativas, es decir, la fecha de inicio del viaje ocurrió antes de la fecha de finalización pero además hay viajes cuya duración es de más de 25 horas. Si ponemos atención en el promedio y la mediana, nos daremos cuenta de que este valor de 25 horas puede ser un outlier. \n",
    "\n",
    "Antes de continuar con cualquier cálculo estadístico debemos quitar los viajes con duración negativa y posteriormente vamos entonces a calcular el IQR (Interquartile Range) para finalmente identificar las fronteras en las que caeran los datos que vamos a utilizar. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "30e4fb59",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:03.773215Z",
     "iopub.status.busy": "2025-02-18T18:19:03.772029Z",
     "iopub.status.idle": "2025-02-18T18:19:04.483705Z",
     "shell.execute_reply": "2025-02-18T18:19:04.482505Z"
    },
    "papermill": {
     "duration": 0.723201,
     "end_time": "2025-02-18T18:19:04.485262",
     "exception": false,
     "start_time": "2025-02-18T18:19:03.762061",
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
       "<ol class=list-inline><li>4208283</li><li>15</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 4208283\n",
       "\\item 15\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 4208283\n",
       "2. 15\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 4208283      15"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "total_trips_2024 <- all_trips_2024_cleaned[!(all_trips_2024_cleaned$trip_duration < 0),]\n",
    "dim(total_trips_2024)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "bfffedff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:04.506901Z",
     "iopub.status.busy": "2025-02-18T18:19:04.505686Z",
     "iopub.status.idle": "2025-02-18T18:19:05.330292Z",
     "shell.execute_reply": "2025-02-18T18:19:05.329080Z"
    },
    "papermill": {
     "duration": 0.837455,
     "end_time": "2025-02-18T18:19:05.332304",
     "exception": false,
     "start_time": "2025-02-18T18:19:04.494849",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"El límite inferior de los datos es:\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] -12\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"El límite superior de los datos es:\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 36\n"
     ]
    }
   ],
   "source": [
    "# Ahora sí podemos continuar con el cálculo del IQR y los límites\n",
    "# Calculamos el IQR:\n",
    "iqr_trip_duration <-  IQR(total_trips_2024$trip_duration)\n",
    "# Límite inferior = Q1 -1.5*IQR donde Q1 es el primer cuartil\n",
    "lower_limit_tripduration <- as.numeric(summary(total_trips_2024$trip_duration)[2] - 1.5*iqr_trip_duration)\n",
    "#limite superior = Q3 + 1.5*IQR donde Q3 es el tercer cuartil  \n",
    "upper_limit_tripduration <- as.numeric(summary(total_trips_2024$trip_duration)[5] + 1.5*iqr_trip_duration)\n",
    "print(\"El límite inferior de los datos es:\")\n",
    "print(lower_limit_tripduration)\n",
    "print(\"El límite superior de los datos es:\")\n",
    "print(upper_limit_tripduration)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7694ee35",
   "metadata": {
    "papermill": {
     "duration": 0.008461,
     "end_time": "2025-02-18T18:19:05.349340",
     "exception": false,
     "start_time": "2025-02-18T18:19:05.340879",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Vemos entonces que los viajes con duración mayor a 36 minutos pueden ser considerados valores extremos mientras que vamos a poner el límite inferior en 0 puesto que los valores negativos no son válidos.  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "bbf46a73",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:05.368918Z",
     "iopub.status.busy": "2025-02-18T18:19:05.367712Z",
     "iopub.status.idle": "2025-02-18T18:19:06.157189Z",
     "shell.execute_reply": "2025-02-18T18:19:06.155998Z"
    },
    "papermill": {
     "duration": 0.80081,
     "end_time": "2025-02-18T18:19:06.158621",
     "exception": false,
     "start_time": "2025-02-18T18:19:05.357811",
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
       "<ol class=list-inline><li>3874691</li><li>15</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 3874691\n",
       "\\item 15\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 3874691\n",
       "2. 15\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 3874691      15"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>day_of_week</th><th scope=col>trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C1D650626C8C899A</td><td>electric_bike</td><td>2024-01-12 15:30:27</td><td>2024-01-12 15:37:59</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-12</td><td>2024</td><td>01</td><td>12</td><td><span style=white-space:pre-wrap>Friday   </span></td><td> 8</td></tr>\n",
       "\t<tr><td>EECD38BDB25BFCB0</td><td>electric_bike</td><td>2024-01-08 15:45:46</td><td>2024-01-08 15:52:59</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-08</td><td>2024</td><td>01</td><td>08</td><td><span style=white-space:pre-wrap>Monday   </span></td><td> 7</td></tr>\n",
       "\t<tr><td>F4A9CE78061F17F7</td><td>electric_bike</td><td>2024-01-27 12:27:19</td><td>2024-01-27 12:35:19</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-27</td><td>2024</td><td>01</td><td>27</td><td>Saturday </td><td> 8</td></tr>\n",
       "\t<tr><td>0A0D9E15EE50B171</td><td>classic_bike </td><td>2024-01-29 16:26:17</td><td>2024-01-29 16:56:06</td><td><span style=white-space:pre-wrap>Wells St &amp; Randolph St    </span></td><td>TA1305000030</td><td>Larrabee St &amp; Webster Ave</td><td><span style=white-space:pre-wrap>13193       </span></td><td>member</td><td>2024-01-29</td><td>2024</td><td>01</td><td>29</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>30</td></tr>\n",
       "\t<tr><td>33FFC9805E3EFF9A</td><td>classic_bike </td><td>2024-01-31 05:43:23</td><td>2024-01-31 06:09:35</td><td>Lincoln Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13253       </span></td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-31</td><td>2024</td><td>01</td><td>31</td><td>Wednesday</td><td>26</td></tr>\n",
       "\t<tr><td>C96080812CD285C5</td><td>classic_bike </td><td>2024-01-07 11:21:24</td><td>2024-01-07 11:30:03</td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St         </span></td><td>KA1504000135</td><td>Kingsbury St &amp; Kinzie St </td><td>KA1503000043</td><td>member</td><td>2024-01-07</td><td>2024</td><td>01</td><td>07</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td> 9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & member\\_casual & date & year & month & day & day\\_of\\_week & trip\\_duration\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <chr> & <date> & <chr> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t C1D650626C8C899A & electric\\_bike & 2024-01-12 15:30:27 & 2024-01-12 15:37:59 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-12 & 2024 & 01 & 12 & Friday    &  8\\\\\n",
       "\t EECD38BDB25BFCB0 & electric\\_bike & 2024-01-08 15:45:46 & 2024-01-08 15:52:59 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-08 & 2024 & 01 & 08 & Monday    &  7\\\\\n",
       "\t F4A9CE78061F17F7 & electric\\_bike & 2024-01-27 12:27:19 & 2024-01-27 12:35:19 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-27 & 2024 & 01 & 27 & Saturday  &  8\\\\\n",
       "\t 0A0D9E15EE50B171 & classic\\_bike  & 2024-01-29 16:26:17 & 2024-01-29 16:56:06 & Wells St \\& Randolph St     & TA1305000030 & Larrabee St \\& Webster Ave & 13193        & member & 2024-01-29 & 2024 & 01 & 29 & Monday    & 30\\\\\n",
       "\t 33FFC9805E3EFF9A & classic\\_bike  & 2024-01-31 05:43:23 & 2024-01-31 06:09:35 & Lincoln Ave \\& Waveland Ave & 13253        & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-31 & 2024 & 01 & 31 & Wednesday & 26\\\\\n",
       "\t C96080812CD285C5 & classic\\_bike  & 2024-01-07 11:21:24 & 2024-01-07 11:30:03 & Wells St \\& Elm St          & KA1504000135 & Kingsbury St \\& Kinzie St  & KA1503000043 & member & 2024-01-07 & 2024 & 01 & 07 & Sunday    &  9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | year &lt;chr&gt; | month &lt;chr&gt; | day &lt;chr&gt; | day_of_week &lt;chr&gt; | trip_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| C1D650626C8C899A | electric_bike | 2024-01-12 15:30:27 | 2024-01-12 15:37:59 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-12 | 2024 | 01 | 12 | Friday    |  8 |\n",
       "| EECD38BDB25BFCB0 | electric_bike | 2024-01-08 15:45:46 | 2024-01-08 15:52:59 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-08 | 2024 | 01 | 08 | Monday    |  7 |\n",
       "| F4A9CE78061F17F7 | electric_bike | 2024-01-27 12:27:19 | 2024-01-27 12:35:19 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-27 | 2024 | 01 | 27 | Saturday  |  8 |\n",
       "| 0A0D9E15EE50B171 | classic_bike  | 2024-01-29 16:26:17 | 2024-01-29 16:56:06 | Wells St &amp; Randolph St     | TA1305000030 | Larrabee St &amp; Webster Ave | 13193        | member | 2024-01-29 | 2024 | 01 | 29 | Monday    | 30 |\n",
       "| 33FFC9805E3EFF9A | classic_bike  | 2024-01-31 05:43:23 | 2024-01-31 06:09:35 | Lincoln Ave &amp; Waveland Ave | 13253        | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-31 | 2024 | 01 | 31 | Wednesday | 26 |\n",
       "| C96080812CD285C5 | classic_bike  | 2024-01-07 11:21:24 | 2024-01-07 11:30:03 | Wells St &amp; Elm St          | KA1504000135 | Kingsbury St &amp; Kinzie St  | KA1503000043 | member | 2024-01-07 | 2024 | 01 | 07 | Sunday    |  9 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C1D650626C8C899A electric_bike 2024-01-12 15:30:27 2024-01-12 15:37:59\n",
       "2 EECD38BDB25BFCB0 electric_bike 2024-01-08 15:45:46 2024-01-08 15:52:59\n",
       "3 F4A9CE78061F17F7 electric_bike 2024-01-27 12:27:19 2024-01-27 12:35:19\n",
       "4 0A0D9E15EE50B171 classic_bike  2024-01-29 16:26:17 2024-01-29 16:56:06\n",
       "5 33FFC9805E3EFF9A classic_bike  2024-01-31 05:43:23 2024-01-31 06:09:35\n",
       "6 C96080812CD285C5 classic_bike  2024-01-07 11:21:24 2024-01-07 11:30:03\n",
       "  start_station_name         start_station_id end_station_name         \n",
       "1 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "2 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "3 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "4 Wells St & Randolph St     TA1305000030     Larrabee St & Webster Ave\n",
       "5 Lincoln Ave & Waveland Ave 13253            Kingsbury St & Kinzie St \n",
       "6 Wells St & Elm St          KA1504000135     Kingsbury St & Kinzie St \n",
       "  end_station_id member_casual date       year month day day_of_week\n",
       "1 KA1503000043   member        2024-01-12 2024 01    12  Friday     \n",
       "2 KA1503000043   member        2024-01-08 2024 01    08  Monday     \n",
       "3 KA1503000043   member        2024-01-27 2024 01    27  Saturday   \n",
       "4 13193          member        2024-01-29 2024 01    29  Monday     \n",
       "5 KA1503000043   member        2024-01-31 2024 01    31  Wednesday  \n",
       "6 KA1503000043   member        2024-01-07 2024 01    07  Sunday     \n",
       "  trip_duration\n",
       "1  8           \n",
       "2  7           \n",
       "3  8           \n",
       "4 30           \n",
       "5 26           \n",
       "6  9           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Seleccionamos los datos con los que vamos a trabajar\n",
    "total_trips_2024 <- total_trips_2024[!(total_trips_2024$trip_duration > 36),]\n",
    "dim(total_trips_2024)\n",
    "head(total_trips_2024)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1e940bdf",
   "metadata": {
    "papermill": {
     "duration": 0.008707,
     "end_time": "2025-02-18T18:19:06.176616",
     "exception": false,
     "start_time": "2025-02-18T18:19:06.167909",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Análisis\n",
    "Ahora vamos a comparar la longitud de los viajes para ambos tipos de usuarios usando estadísticas como el promedio, la media, el mínimo y el máximo. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "47d9caa1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:06.197364Z",
     "iopub.status.busy": "2025-02-18T18:19:06.196107Z",
     "iopub.status.idle": "2025-02-18T18:19:12.835753Z",
     "shell.execute_reply": "2025-02-18T18:19:12.834591Z"
    },
    "papermill": {
     "duration": 6.651771,
     "end_time": "2025-02-18T18:19:12.837264",
     "exception": false,
     "start_time": "2025-02-18T18:19:06.185493",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Duración promedio de viaje por usuario [minutos]\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"---------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>total_trips_2024$member_casual</th><th scope=col>total_trips_2024$trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>13.32826</td></tr>\n",
       "\t<tr><td>member</td><td>10.60258</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " total\\_trips\\_2024\\$member\\_casual & total\\_trips\\_2024\\$trip\\_duration\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 13.32826\\\\\n",
       "\t member & 10.60258\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| total_trips_2024$member_casual &lt;chr&gt; | total_trips_2024$trip_duration &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 13.32826 |\n",
       "| member | 10.60258 |\n",
       "\n"
      ],
      "text/plain": [
       "  total_trips_2024$member_casual total_trips_2024$trip_duration\n",
       "1 casual                         13.32826                      \n",
       "2 member                         10.60258                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Mediana de la duración de viajes por usuario [minutos]\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"---------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>total_trips_2024$member_casual</th><th scope=col>total_trips_2024$trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>11</td></tr>\n",
       "\t<tr><td>member</td><td> 9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " total\\_trips\\_2024\\$member\\_casual & total\\_trips\\_2024\\$trip\\_duration\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 11\\\\\n",
       "\t member &  9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| total_trips_2024$member_casual &lt;chr&gt; | total_trips_2024$trip_duration &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 11 |\n",
       "| member |  9 |\n",
       "\n"
      ],
      "text/plain": [
       "  total_trips_2024$member_casual total_trips_2024$trip_duration\n",
       "1 casual                         11                            \n",
       "2 member                          9                            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Máxima duración de viaje por usuario [minutos]\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"---------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>total_trips_2024$member_casual</th><th scope=col>total_trips_2024$trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>36</td></tr>\n",
       "\t<tr><td>member</td><td>36</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " total\\_trips\\_2024\\$member\\_casual & total\\_trips\\_2024\\$trip\\_duration\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 36\\\\\n",
       "\t member & 36\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| total_trips_2024$member_casual &lt;chr&gt; | total_trips_2024$trip_duration &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 36 |\n",
       "| member | 36 |\n",
       "\n"
      ],
      "text/plain": [
       "  total_trips_2024$member_casual total_trips_2024$trip_duration\n",
       "1 casual                         36                            \n",
       "2 member                         36                            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Mínima duración de viaje por usuario [minutos]\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"---------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>total_trips_2024$member_casual</th><th scope=col>total_trips_2024$trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>0</td></tr>\n",
       "\t<tr><td>member</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " total\\_trips\\_2024\\$member\\_casual & total\\_trips\\_2024\\$trip\\_duration\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 0\\\\\n",
       "\t member & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| total_trips_2024$member_casual &lt;chr&gt; | total_trips_2024$trip_duration &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 0 |\n",
       "| member | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  total_trips_2024$member_casual total_trips_2024$trip_duration\n",
       "1 casual                         0                             \n",
       "2 member                         0                             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "print(\"Duración promedio de viaje por usuario [minutos]\")\n",
    "print(\"---------------------\")\n",
    "aggregate(total_trips_2024$trip_duration ~ total_trips_2024$member_casual, FUN = mean)\n",
    "print(\"Mediana de la duración de viajes por usuario [minutos]\")\n",
    "print(\"---------------------\")\n",
    "aggregate(total_trips_2024$trip_duration ~ total_trips_2024$member_casual, FUN = median)\n",
    "print(\"Máxima duración de viaje por usuario [minutos]\")\n",
    "print(\"---------------------\")\n",
    "aggregate(total_trips_2024$trip_duration ~ total_trips_2024$member_casual, FUN = max)\n",
    "print(\"Mínima duración de viaje por usuario [minutos]\")\n",
    "print(\"---------------------\")\n",
    "aggregate(total_trips_2024$trip_duration ~ total_trips_2024$member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2aa357e6",
   "metadata": {
    "papermill": {
     "duration": 0.009168,
     "end_time": "2025-02-18T18:19:12.856393",
     "exception": false,
     "start_time": "2025-02-18T18:19:12.847225",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Los viajes con duración mínima de cero pueden deberse a errores al momento de rentar la bicicleta o al iniciar un viaje con ella. Ahora vamos a ver cómo compara el tiempo de viaje para cada tipo de usuario a lo largo de la semana y ordenado por dia, iniciando por el domingo:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "c7d13b6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:12.909121Z",
     "iopub.status.busy": "2025-02-18T18:19:12.907839Z",
     "iopub.status.idle": "2025-02-18T18:19:14.360409Z",
     "shell.execute_reply": "2025-02-18T18:19:14.359240Z"
    },
    "papermill": {
     "duration": 1.496356,
     "end_time": "2025-02-18T18:19:14.361945",
     "exception": false,
     "start_time": "2025-02-18T18:19:12.865589",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>total_trips_2024$member_casual</th><th scope=col>total_trips_2024$day_of_week</th><th scope=col>total_trips_2024$trip_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>14.46786</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>11.32144</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>12.71766</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>10.23033</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>12.18752</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>10.36607</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>12.42751</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>10.49327</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>12.38084</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>10.36793</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>13.17072</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>10.37751</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>14.67541</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>11.43937</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " total\\_trips\\_2024\\$member\\_casual & total\\_trips\\_2024\\$day\\_of\\_week & total\\_trips\\_2024\\$trip\\_duration\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 14.46786\\\\\n",
       "\t member & Sunday    & 11.32144\\\\\n",
       "\t casual & Monday    & 12.71766\\\\\n",
       "\t member & Monday    & 10.23033\\\\\n",
       "\t casual & Tuesday   & 12.18752\\\\\n",
       "\t member & Tuesday   & 10.36607\\\\\n",
       "\t casual & Wednesday & 12.42751\\\\\n",
       "\t member & Wednesday & 10.49327\\\\\n",
       "\t casual & Thursday  & 12.38084\\\\\n",
       "\t member & Thursday  & 10.36793\\\\\n",
       "\t casual & Friday    & 13.17072\\\\\n",
       "\t member & Friday    & 10.37751\\\\\n",
       "\t casual & Saturday  & 14.67541\\\\\n",
       "\t member & Saturday  & 11.43937\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| total_trips_2024$member_casual &lt;chr&gt; | total_trips_2024$day_of_week &lt;ord&gt; | total_trips_2024$trip_duration &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 14.46786 |\n",
       "| member | Sunday    | 11.32144 |\n",
       "| casual | Monday    | 12.71766 |\n",
       "| member | Monday    | 10.23033 |\n",
       "| casual | Tuesday   | 12.18752 |\n",
       "| member | Tuesday   | 10.36607 |\n",
       "| casual | Wednesday | 12.42751 |\n",
       "| member | Wednesday | 10.49327 |\n",
       "| casual | Thursday  | 12.38084 |\n",
       "| member | Thursday  | 10.36793 |\n",
       "| casual | Friday    | 13.17072 |\n",
       "| member | Friday    | 10.37751 |\n",
       "| casual | Saturday  | 14.67541 |\n",
       "| member | Saturday  | 11.43937 |\n",
       "\n"
      ],
      "text/plain": [
       "   total_trips_2024$member_casual total_trips_2024$day_of_week\n",
       "1  casual                         Sunday                      \n",
       "2  member                         Sunday                      \n",
       "3  casual                         Monday                      \n",
       "4  member                         Monday                      \n",
       "5  casual                         Tuesday                     \n",
       "6  member                         Tuesday                     \n",
       "7  casual                         Wednesday                   \n",
       "8  member                         Wednesday                   \n",
       "9  casual                         Thursday                    \n",
       "10 member                         Thursday                    \n",
       "11 casual                         Friday                      \n",
       "12 member                         Friday                      \n",
       "13 casual                         Saturday                    \n",
       "14 member                         Saturday                    \n",
       "   total_trips_2024$trip_duration\n",
       "1  14.46786                      \n",
       "2  11.32144                      \n",
       "3  12.71766                      \n",
       "4  10.23033                      \n",
       "5  12.18752                      \n",
       "6  10.36607                      \n",
       "7  12.42751                      \n",
       "8  10.49327                      \n",
       "9  12.38084                      \n",
       "10 10.36793                      \n",
       "11 13.17072                      \n",
       "12 10.37751                      \n",
       "13 14.67541                      \n",
       "14 11.43937                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "total_trips_2024$day_of_week <- ordered(total_trips_2024$day_of_week, levels=\n",
    "                                          c(\"Sunday\", \"Monday\", \"Tuesday\",\n",
    "                                            \"Wednesday\", \"Thursday\", \"Friday\",\n",
    "                                            \"Saturday\"))\n",
    "aggregate(total_trips_2024$trip_duration ~ total_trips_2024$member_casual + \n",
    "            total_trips_2024$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "530d107c",
   "metadata": {
    "papermill": {
     "duration": 0.009631,
     "end_time": "2025-02-18T18:19:14.381665",
     "exception": false,
     "start_time": "2025-02-18T18:19:14.372034",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Ahora agruparemos los viajes en bicicleta por día y por tipo de usuario"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "8309783b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:14.403596Z",
     "iopub.status.busy": "2025-02-18T18:19:14.402388Z",
     "iopub.status.idle": "2025-02-18T18:19:17.406390Z",
     "shell.execute_reply": "2025-02-18T18:19:17.405185Z"
    },
    "papermill": {
     "duration": 3.01734,
     "end_time": "2025-02-18T18:19:17.408561",
     "exception": false,
     "start_time": "2025-02-18T18:19:14.391221",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>213689</td><td>14.46786</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>154195</td><td>12.71766</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>143718</td><td>12.18752</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>164578</td><td>12.42751</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>161188</td><td>12.38084</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>189987</td><td>13.17072</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>256438</td><td>14.67541</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>279425</td><td>11.32144</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>386756</td><td>10.23033</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>409529</td><td>10.36607</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>433402</td><td>10.49327</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>402351</td><td>10.36793</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>364256</td><td>10.37751</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>315179</td><td>11.43937</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 213689 & 14.46786\\\\\n",
       "\t casual & Mon & 154195 & 12.71766\\\\\n",
       "\t casual & Tue & 143718 & 12.18752\\\\\n",
       "\t casual & Wed & 164578 & 12.42751\\\\\n",
       "\t casual & Thu & 161188 & 12.38084\\\\\n",
       "\t casual & Fri & 189987 & 13.17072\\\\\n",
       "\t casual & Sat & 256438 & 14.67541\\\\\n",
       "\t member & Sun & 279425 & 11.32144\\\\\n",
       "\t member & Mon & 386756 & 10.23033\\\\\n",
       "\t member & Tue & 409529 & 10.36607\\\\\n",
       "\t member & Wed & 433402 & 10.49327\\\\\n",
       "\t member & Thu & 402351 & 10.36793\\\\\n",
       "\t member & Fri & 364256 & 10.37751\\\\\n",
       "\t member & Sat & 315179 & 11.43937\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 213689 | 14.46786 |\n",
       "| casual | Mon | 154195 | 12.71766 |\n",
       "| casual | Tue | 143718 | 12.18752 |\n",
       "| casual | Wed | 164578 | 12.42751 |\n",
       "| casual | Thu | 161188 | 12.38084 |\n",
       "| casual | Fri | 189987 | 13.17072 |\n",
       "| casual | Sat | 256438 | 14.67541 |\n",
       "| member | Sun | 279425 | 11.32144 |\n",
       "| member | Mon | 386756 | 10.23033 |\n",
       "| member | Tue | 409529 | 10.36607 |\n",
       "| member | Wed | 433402 | 10.49327 |\n",
       "| member | Thu | 402351 | 10.36793 |\n",
       "| member | Fri | 364256 | 10.37751 |\n",
       "| member | Sat | 315179 | 11.43937 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     213689          14.46786        \n",
       "2  casual        Mon     154195          12.71766        \n",
       "3  casual        Tue     143718          12.18752        \n",
       "4  casual        Wed     164578          12.42751        \n",
       "5  casual        Thu     161188          12.38084        \n",
       "6  casual        Fri     189987          13.17072        \n",
       "7  casual        Sat     256438          14.67541        \n",
       "8  member        Sun     279425          11.32144        \n",
       "9  member        Mon     386756          10.23033        \n",
       "10 member        Tue     409529          10.36607        \n",
       "11 member        Wed     433402          10.49327        \n",
       "12 member        Thu     402351          10.36793        \n",
       "13 member        Fri     364256          10.37751        \n",
       "14 member        Sat     315179          11.43937        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "total_trips_2024 %>%\n",
    "mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "group_by(member_casual, weekday) %>% \n",
    "summarise(number_of_rides = n() \n",
    ",average_duration = mean(trip_duration)) %>% \n",
    "arrange(member_casual, weekday) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4f0007b4",
   "metadata": {
    "papermill": {
     "duration": 0.010848,
     "end_time": "2025-02-18T18:19:17.429763",
     "exception": false,
     "start_time": "2025-02-18T18:19:17.418915",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "A primera vista de la tabla podemos ver que los usuarios que son suscriptores anuales usan las bicicletas por menos tiempo que los usuarios casuales pero realizan el doble o incluso más viajes a lo largo de la semana con excepción de los domingos en los que el número de viajes entre usuarios casuales y suscriptores no es tan diferente comparado con los otros días. \n",
    "\n",
    "Lo anterior podemos visualizarlo con un gráfico de barras:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "9d627870",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:17.454185Z",
     "iopub.status.busy": "2025-02-18T18:19:17.452887Z",
     "iopub.status.idle": "2025-02-18T18:19:20.769612Z",
     "shell.execute_reply": "2025-02-18T18:19:20.768272Z"
    },
    "papermill": {
     "duration": 3.33087,
     "end_time": "2025-02-18T18:19:20.771535",
     "exception": false,
     "start_time": "2025-02-18T18:19:17.440665",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nH/rtxfnSb+z8ZzcrBvPUR+J8NR7c+YkDSRlPfvzL1F4XP8g++88mX+3zV5tiueaWXtfc0ktE\n3Knxqz6bc9/9Y755+c6Pn0y+t4zPC1N/czylXbg165KEXT+KiCMmTgq65y9fUVSlzfMhp1xe\nPvl/pHJ2kt/nki/BeogBIFd8FFsQXWcvaegw/7ts8HM/H8+1QfLxS34N/fD3EwthVMU8sk6E\n2xk/elP8pSs8QxrHVqhQ4atTPn+C3RgS27ec3ZW6f+TGSwp2pe59attJxWB5uk4unzSFVX6y\ntNmQ8NezKy7t+fTvE9cmphdKYSLiqDDozmhb4t+Tfjn284t/JZSuO6F1KUuuLVV34qL4FJO1\nStZ3YhE5u3eXz94Dqy0l/qNatWo1avFU5mqjrezNfZ6dXitSVdUVfn/b/ounv81W5puPbxCR\nZk/Xl4Lu+ctXFFVp83wQvy+fwB8p/6/BgjyXfAjWQwwAuQv22RvFWrazYrP6+7O+mfsw61mx\nu2a0FJGI2g8cc54/i+70zi/rO8yS46zYVrN2Z+3wh67VRWTg3kuumvZStXDJcrJh/C+jRcQS\n2uiTTefPN/S4zn7w9A0iEln7ce8S70l8Wa/i5nVgYU8RsUZcu2TXGe+SjKS/ht1YUUSqdM52\nBuVF3/StLSIRtbtv+Pf8mYyndy1tHXX+oEi+CvNj25imIlKrZ6yI3PvDJWcpXnr6obuGzaQo\nyrt/XNxLmz+dUsduFpFKbb/zLsl2Vmwgtbmdx6PNRkUxPr/498yeT/zxTW2bWVFMPySk5Vr2\nhQuLGAfNXOm9II0nI+Hdp9uJiCW0aeYTIJA97+tRy8l7VmxYpaE+dlFhVpVTUT8f8nz5BPJI\nBfIaDPC5pPp4aLLt84LtTAAoCgQ7f/wEO1X1jGwcnTPYpSeu916RLiS6Xuc7u7dr3sBmUCxh\nTRqHWi4/2Kmq+uWIm7yDVmvUvH2762KjQ0TEGt506bFkbwPfEcEztXdD71t+5TrNrr+mnve6\nteE179id4u+CtPfERXi3qlS7aeOa5RVFsUY0f6N/rfwW5kfKiU+925pCqp/KuOQqbtneQTeM\naSsiBqOj9c1d7unasXHtcgZjaK+Ro0TEaKnQ/5HBKW5PzgsUB1Lbz+Nu9rYpW7PxjR3aX9Oo\npkFRRKTDqOW+yvZGqMf7txIRS3ilq5s3jLQaRcRojpryU9YrX+S95wMPdu6Mk1aDoijmW+7q\n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"
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
    "total_trips_2024 %>%\n",
    "mutate(weekday = wday(started_at, label = TRUE)) %>%\n",
    "group_by(member_casual, weekday) %>%\n",
    "summarise(number_of_rides = n()\n",
    ",average_duration = mean(trip_duration)) %>%\n",
    "arrange(member_casual, weekday) %>%\n",
    "ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Número de viajes por tipo de usuario\",\n",
    "       subtitle = \"Datos del año 2024\",\n",
    "       x=\"Día de la semana\", \n",
    "       y=\"Número de viajes\", \n",
    "       fill = \"Tipo de usuario\") +\n",
    "  scale_y_continuous(breaks = seq(0, 400000, 50000), labels = scales::comma)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8ddcbae0",
   "metadata": {
    "papermill": {
     "duration": 0.010893,
     "end_time": "2025-02-18T18:19:20.793719",
     "exception": false,
     "start_time": "2025-02-18T18:19:20.782826",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "De la figura anterior vemos que los suscriptores realizan un mayor número de viajes durante la semana mientras que en los fines de semana tanto suscriptores como usuarios casuales realizan un número de viajes muy similar. Hagamos lo mismo pero ahora con la duración de los viajes:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "70b2a156",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:20.818588Z",
     "iopub.status.busy": "2025-02-18T18:19:20.817370Z",
     "iopub.status.idle": "2025-02-18T18:19:24.127007Z",
     "shell.execute_reply": "2025-02-18T18:19:24.125704Z"
    },
    "papermill": {
     "duration": 3.323928,
     "end_time": "2025-02-18T18:19:24.128737",
     "exception": false,
     "start_time": "2025-02-18T18:19:20.804809",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n2JRxolrw7M8XvNu+3J410zc8kHCOqZmSQs89yfjv+bIOfz7Joerr02e9Y9WAuSLjV4GVIyYd\nCQ94b9zUuTOmtK1s+mbWB/cSTX2Wru7j6+jXdOo3Xw2zcnrYHj6KzUSZNyZ+Xu7Q3l9+P7Fn\n/cZVX2gMrhWq1w3u2bOStyHTdR1rDu/ZrJIQIqDt0GLfHjofGi+8X7xvE5fpUS98yJdxppft\n1aro29/dMvnOLuy04t9bY++t+d+t6Pe/HvuKp0EIUapc+TNduy/bfP3T7iWELHsgS+LDtm66\nGPnxd8MqOOqEECVKVzD+3m3t4jPNplS3drSsKdSsqnHjxn2RCa/Y398VkdCzUUGNvaGxm93+\nn263e6P4iSOhTgH91enPt3LrHy/EG2bPHG4+2KJMWfvO3T+29pxynnulYT2bVhJC+Lcd6vfN\nwXPhCcJT5ifV+Id7R47cm3pk5fdb3TUqIUSkT78uTSpaKVfuyvhVwPvVju82blXNVS+E8Pft\ntGzb5CsJyT7OdnqVSq3V29nprB0fNkfm56CcUqRSvd6V6gkh4sJDTh79fceGdRMHnfz02wVF\n7DI51bhv0yIpl100avFingraqVDXIuotK649Gljc9eKqXzwrv22X6siJyHOnNHb+jTwf11yV\n2r5dQYeFR26I7iWELHsgS6JvHVcUZcwbHVIPOiaHCPGCFTv7Au2dNJv2nY6o6rlG6Aq29jAI\nIZrX9R63e7/o4r89LD6ge1mR/nxDD4YY3JulHEKrd365qpMuLO+nkcv8mj/5CJedQ4HOa7/q\nluZNBRsH5HGYvJTBq0Cbdi1O/X5k842Qe/fuXj33p7WTAhS7DCU+Ojx7wYEew0f66zVCCHsP\nv1rN2lerW6ZDl9HfXo8ak9bXqJNS/ZKHzl6KH5lRaXvXKPDZ8lMDp7z81fEHdeaWSX2joggh\nnvhcWq1WCcVkvizJHrCM+U+vddSrNI7r1nyd+iaV+sX7v3aVxql9AYcdO65eNlxwKdbDfNoT\n/9Y143dsvnTPMzLZ1Leyp0h/vpcW7Hpqg65atXzFzt4h80dBXNCCAAATV0lEQVR4km38uo+D\ns5yvJhm/Cowqljx10OCLjuVerVO5fPXApm0aDHtvsrUjw9bJ/7+Yz0OjL/jn77+vO/7E65Ex\n/qEQwtfpv5fq6OTHT9wJkYejjRI+iZfq1ij83Fd3bnxzWxTq5v/EWbvcypU3JtzcHxFvvqqY\n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\nB407ztvnF9So9Ss1W9Vp/sHkSiH9mw6+n8aSaq1aCKF+8p0/tcE91RW9EOKlEctT3gxLYeda\nOdOclicRQtQfsfJ+r9FbtuzYf/CXw7tXfLds3rChNbec3tfU0/CcMbIRTKXSpb921uYFAPkZ\nxQ6wMiU5fPiyizrHCqMCnJ+9NTHqt87z9gW0XHJ9R/+Uwa/T2VSBesWE+GPtybCOTfxTBu/+\n/GfKZYNHS43q/eSHZV59tXbKYHLc+U3b/vKt5JBxziwlSYq+cPzMQ89KVbv0H96l/3AhxLkf\np5RrOX7IRyfOLq71PDGeM1iOrw4A+QrfsQOsyZQcPrdHnYORCQ0mf+OkSeNLdsmx542K4lG5\naspI7J0jc0KihEjjZBxeFad76zU/9RxyISbZPJIY+deAEcdTFtAaSk4s5/HP6p4/3/3vC2Rr\n3mn7xhtv3MjsySBLSWLuLa5Zs2anT06kjBStVl0IkRyT/JwxnjNYjq8OAPkK79gBeerqmtmj\nT5q/vWWKDL1xcMfWM/fiSrX/eMfQSmku71CgSxPPQftmtRqsG17V3+HKmd++XLKthK8h8ebx\n+d9u6PNGsGOqT141hmK7Z7ev9N6GoGK13uze3Fvc27FidWTNrmLX8pRl3t+5aFnpbi1KVHi9\nS5uqpTxO7123evfFl3qtftM7k7fKspTEteikJgWW/jylfssrvWuWL256eG3Ll8s1Os+J04Ke\nM0Y2guXgvAAgv7PuQbmA7TCf7iQ1e2ePsrVaTvpyd3KqxZ493Un0jT09m9fw83R08S3e8LXu\n28+Ehx6dWdTdQe9U4FZC8rN39Nu3H78SVNzJTuvsFdDhnQVR0WdFqtOdKIry8MKut9s18HVz\n0jt4BFauO2HZj0mmZzejKM+c7iRLSWLvHn63c5PCXi5atcbZ079Buz7fn3iQeoEMYqwJ9LRz\nqZN6YXetunDz3U/tpdYn71sS7NmtXd3SSAix6UFs9vYwAORbKkXh4wYAAAAZ8B07AAAASVDs\nAAAAJEGxAwAAkATFDgAAQBIUOwAAAElQ7AAAACRBsQMAAJAExQ4AAEASFDsAAABJUOwAAAAk\nQbEDAACQBMUOAABAEhQ7AAAASVDsAACQRPS9O5FGxdopYE0UOwBADtsR5KP6l1qt9ypUutOg\n6ZdikzNdMeLS+Ut34nI8z/girlUnncx4GQ+dps8/EVna7NSWZT2KN9399/UTS+vVnHs6S+ua\n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"
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
    "total_trips_2024 %>%\n",
    "mutate(weekday = wday(started_at, label = TRUE)) %>%\n",
    "group_by(member_casual, weekday) %>%\n",
    "summarise(number_of_rides = n()\n",
    ",average_duration = mean(trip_duration)) %>%\n",
    "arrange(member_casual, weekday) %>%\n",
    "ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +\n",
    "geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Número de viajes por tipo de usuario\",\n",
    "       caption = \"Datos del año 2024\",\n",
    "       x=\"Día de la semana\", \n",
    "       y=\"Duración promedio de viaje en minutos\", \n",
    "       fill = \"Tipo de usuario\") + \n",
    "  scale_y_continuous(breaks = seq(0, 35, 5))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c8c1c375",
   "metadata": {
    "papermill": {
     "duration": 0.01131,
     "end_time": "2025-02-18T18:19:24.151832",
     "exception": false,
     "start_time": "2025-02-18T18:19:24.140522",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Mientras que la duración de los viajes que hacen los suscriptores en promedio es de 10 minutos entre semana y aumenta los fines de semana un poco, los viajes que realizan los usuarios casuales siempre es mayor y cambia a lo largo de la semana siendo los fines de semana cuando más largos son los viajes. Esto podría sugerir que los usuarios casuales usan las bicicletas más por recreación mientras que los suscriptores podrían estar moviéndose de y hacia sus trabajos durante la semana. \n",
    "Ya que también tenemos datos de los meses, podemos estudiar el número de viajes y la duración promedio de estos mes con mes: "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "bf54c6d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:24.177780Z",
     "iopub.status.busy": "2025-02-18T18:19:24.176539Z",
     "iopub.status.idle": "2025-02-18T18:19:28.013772Z",
     "shell.execute_reply": "2025-02-18T18:19:28.012540Z"
    },
    "papermill": {
     "duration": 3.852637,
     "end_time": "2025-02-18T18:19:28.015965",
     "exception": false,
     "start_time": "2025-02-18T18:19:24.163328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 24 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>monthd</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Jan</td><td> 16743</td><td> 9.416950</td></tr>\n",
       "\t<tr><td>casual</td><td>Feb</td><td> 34172</td><td>11.326642</td></tr>\n",
       "\t<tr><td>casual</td><td>Mar</td><td> 54299</td><td>12.563657</td></tr>\n",
       "\t<tr><td>casual</td><td>Apr</td><td> 77933</td><td>13.199351</td></tr>\n",
       "\t<tr><td>casual</td><td>May</td><td>135585</td><td>14.054800</td></tr>\n",
       "\t<tr><td>casual</td><td>Jun</td><td>171368</td><td>14.295376</td></tr>\n",
       "\t<tr><td>casual</td><td>Jul</td><td>189182</td><td>14.233225</td></tr>\n",
       "\t<tr><td>casual</td><td>Aug</td><td>191229</td><td>13.925001</td></tr>\n",
       "\t<tr><td>casual</td><td>Sep</td><td>186427</td><td>12.921615</td></tr>\n",
       "\t<tr><td>casual</td><td>Oct</td><td>137537</td><td>12.764187</td></tr>\n",
       "\t<tr><td>casual</td><td>Nov</td><td> 62761</td><td>11.272096</td></tr>\n",
       "\t<tr><td>casual</td><td>Dec</td><td> 26557</td><td>10.252852</td></tr>\n",
       "\t<tr><td>member</td><td>Jan</td><td> 94057</td><td> 8.930925</td></tr>\n",
       "\t<tr><td>member</td><td>Feb</td><td>142424</td><td> 9.801979</td></tr>\n",
       "\t<tr><td>member</td><td>Mar</td><td>162547</td><td> 9.908574</td></tr>\n",
       "\t<tr><td>member</td><td>Apr</td><td>196369</td><td>10.376633</td></tr>\n",
       "\t<tr><td>member</td><td>May</td><td>262858</td><td>11.177716</td></tr>\n",
       "\t<tr><td>member</td><td>Jun</td><td>272919</td><td>11.555209</td></tr>\n",
       "\t<tr><td>member</td><td>Jul</td><td>295506</td><td>11.422888</td></tr>\n",
       "\t<tr><td>member</td><td>Aug</td><td>300007</td><td>11.158490</td></tr>\n",
       "\t<tr><td>member</td><td>Sep</td><td>310131</td><td>10.668411</td></tr>\n",
       "\t<tr><td>member</td><td>Oct</td><td>280785</td><td>10.297755</td></tr>\n",
       "\t<tr><td>member</td><td>Nov</td><td>172991</td><td> 9.562844</td></tr>\n",
       "\t<tr><td>member</td><td>Dec</td><td>100304</td><td> 9.138329</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 24 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & monthd & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Jan &  16743 &  9.416950\\\\\n",
       "\t casual & Feb &  34172 & 11.326642\\\\\n",
       "\t casual & Mar &  54299 & 12.563657\\\\\n",
       "\t casual & Apr &  77933 & 13.199351\\\\\n",
       "\t casual & May & 135585 & 14.054800\\\\\n",
       "\t casual & Jun & 171368 & 14.295376\\\\\n",
       "\t casual & Jul & 189182 & 14.233225\\\\\n",
       "\t casual & Aug & 191229 & 13.925001\\\\\n",
       "\t casual & Sep & 186427 & 12.921615\\\\\n",
       "\t casual & Oct & 137537 & 12.764187\\\\\n",
       "\t casual & Nov &  62761 & 11.272096\\\\\n",
       "\t casual & Dec &  26557 & 10.252852\\\\\n",
       "\t member & Jan &  94057 &  8.930925\\\\\n",
       "\t member & Feb & 142424 &  9.801979\\\\\n",
       "\t member & Mar & 162547 &  9.908574\\\\\n",
       "\t member & Apr & 196369 & 10.376633\\\\\n",
       "\t member & May & 262858 & 11.177716\\\\\n",
       "\t member & Jun & 272919 & 11.555209\\\\\n",
       "\t member & Jul & 295506 & 11.422888\\\\\n",
       "\t member & Aug & 300007 & 11.158490\\\\\n",
       "\t member & Sep & 310131 & 10.668411\\\\\n",
       "\t member & Oct & 280785 & 10.297755\\\\\n",
       "\t member & Nov & 172991 &  9.562844\\\\\n",
       "\t member & Dec & 100304 &  9.138329\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 24 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | monthd &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Jan |  16743 |  9.416950 |\n",
       "| casual | Feb |  34172 | 11.326642 |\n",
       "| casual | Mar |  54299 | 12.563657 |\n",
       "| casual | Apr |  77933 | 13.199351 |\n",
       "| casual | May | 135585 | 14.054800 |\n",
       "| casual | Jun | 171368 | 14.295376 |\n",
       "| casual | Jul | 189182 | 14.233225 |\n",
       "| casual | Aug | 191229 | 13.925001 |\n",
       "| casual | Sep | 186427 | 12.921615 |\n",
       "| casual | Oct | 137537 | 12.764187 |\n",
       "| casual | Nov |  62761 | 11.272096 |\n",
       "| casual | Dec |  26557 | 10.252852 |\n",
       "| member | Jan |  94057 |  8.930925 |\n",
       "| member | Feb | 142424 |  9.801979 |\n",
       "| member | Mar | 162547 |  9.908574 |\n",
       "| member | Apr | 196369 | 10.376633 |\n",
       "| member | May | 262858 | 11.177716 |\n",
       "| member | Jun | 272919 | 11.555209 |\n",
       "| member | Jul | 295506 | 11.422888 |\n",
       "| member | Aug | 300007 | 11.158490 |\n",
       "| member | Sep | 310131 | 10.668411 |\n",
       "| member | Oct | 280785 | 10.297755 |\n",
       "| member | Nov | 172991 |  9.562844 |\n",
       "| member | Dec | 100304 |  9.138329 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual monthd number_of_rides average_duration\n",
       "1  casual        Jan     16743           9.416950       \n",
       "2  casual        Feb     34172          11.326642       \n",
       "3  casual        Mar     54299          12.563657       \n",
       "4  casual        Apr     77933          13.199351       \n",
       "5  casual        May    135585          14.054800       \n",
       "6  casual        Jun    171368          14.295376       \n",
       "7  casual        Jul    189182          14.233225       \n",
       "8  casual        Aug    191229          13.925001       \n",
       "9  casual        Sep    186427          12.921615       \n",
       "10 casual        Oct    137537          12.764187       \n",
       "11 casual        Nov     62761          11.272096       \n",
       "12 casual        Dec     26557          10.252852       \n",
       "13 member        Jan     94057           8.930925       \n",
       "14 member        Feb    142424           9.801979       \n",
       "15 member        Mar    162547           9.908574       \n",
       "16 member        Apr    196369          10.376633       \n",
       "17 member        May    262858          11.177716       \n",
       "18 member        Jun    272919          11.555209       \n",
       "19 member        Jul    295506          11.422888       \n",
       "20 member        Aug    300007          11.158490       \n",
       "21 member        Sep    310131          10.668411       \n",
       "22 member        Oct    280785          10.297755       \n",
       "23 member        Nov    172991           9.562844       \n",
       "24 member        Dec    100304           9.138329       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "total_trips_2024 %>% mutate(monthd = month(started_at, label = TRUE)) %>% \n",
    "     group_by(member_casual, monthd) %>% \n",
    "     summarise(number_of_rides = n(), average_duration = mean(trip_duration)) %>% \n",
    "     arrange(member_casual, monthd)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "88190d64",
   "metadata": {
    "papermill": {
     "duration": 0.012038,
     "end_time": "2025-02-18T18:19:28.041219",
     "exception": false,
     "start_time": "2025-02-18T18:19:28.029181",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Para entender de mejor manera lo que dice la tabla, vamos a ponerlo de manera gráfica:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e390fe7d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:28.070034Z",
     "iopub.status.busy": "2025-02-18T18:19:28.068765Z",
     "iopub.status.idle": "2025-02-18T18:19:30.973682Z",
     "shell.execute_reply": "2025-02-18T18:19:30.972367Z"
    },
    "papermill": {
     "duration": 2.922532,
     "end_time": "2025-02-18T18:19:30.975689",
     "exception": false,
     "start_time": "2025-02-18T18:19:28.053157",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nrkJggg=="
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
    "total_trips_2024 %>% mutate(monthd = month(started_at, label = TRUE)) %>% \n",
    "     group_by(member_casual, monthd) %>% \n",
    "     summarise(number_of_rides = n(), average_duration = mean(trip_duration)) %>% \n",
    "     arrange(member_casual, monthd) %>% \n",
    "ggplot(aes(x = monthd, y = number_of_rides, fill = member_casual)) +\n",
    "geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Número de viajes por tipo de usuario\",\n",
    "       caption = \"Datos del año 2024\",\n",
    "       x=\"Mes\", \n",
    "       y=\"Número de viajes\", \n",
    "       fill = \"Tipo de usuario\")+\n",
    "scale_y_continuous(breaks = seq(0, 350000, 50000), labels = scales::comma)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "eef46fe4",
   "metadata": {
    "papermill": {
     "duration": 0.016002,
     "end_time": "2025-02-18T18:19:31.005572",
     "exception": false,
     "start_time": "2025-02-18T18:19:30.989570",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "En este gráfico podemos apreciar que la tendencia en el número de viajes por tipo de usuario se mantiene, es decir, los suscriptores realizan un mayor número de viajes a comparación de los usuarios casuales. Podemos observar además que el número de viajes se incrementa a lo largo del año, llegando a un máximo entre los meses de Julio a Septiembre y luego disminuye hacia el final. Este resultado sugiere que a los suscriptores tienen unmayor beneficio al adquirir paquetes anuales. \n",
    "\n",
    "Veamos si la duración de los viajes se mantiene a lo largo del año: "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "ceaa4571",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:31.035762Z",
     "iopub.status.busy": "2025-02-18T18:19:31.034557Z",
     "iopub.status.idle": "2025-02-18T18:19:33.960932Z",
     "shell.execute_reply": "2025-02-18T18:19:33.959640Z"
    },
    "papermill": {
     "duration": 2.942637,
     "end_time": "2025-02-18T18:19:33.962633",
     "exception": false,
     "start_time": "2025-02-18T18:19:31.019996",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
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
    "total_trips_2024 %>% mutate(monthd = month(started_at, label = TRUE)) %>% \n",
    "     group_by(member_casual, monthd) %>% \n",
    "     summarise(number_of_rides = n(), average_duration = mean(trip_duration)) %>% \n",
    "     arrange(member_casual, monthd) %>% \n",
    "ggplot(aes(x = monthd, y = average_duration, fill = member_casual)) +\n",
    "geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Duración promedio de viaje por tipo de usuario\",\n",
    "       caption = \"Datos del año 2024\",\n",
    "       x=\"Mes\", \n",
    "       y=\"Duración promedio de viaje en minutos\", \n",
    "       fill = \"Tipo de usuario\") +\n",
    "  scale_y_continuous(breaks = seq(0,30,5))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0d10369b",
   "metadata": {
    "papermill": {
     "duration": 0.01327,
     "end_time": "2025-02-18T18:19:33.990220",
     "exception": false,
     "start_time": "2025-02-18T18:19:33.976950",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Conclusiones \n",
    "\n",
    "En este proyecto de análisis nos enfocamos en revisar datos de viajes en bicicleta de dos tipos de usuarios de la empresa Cyclistic: los casuales y los suscriptores. Esto con el fin de responder a una pregunta empresarial\n",
    "**¿En que se diferencian los suscriptores de los usuarios casuales?**\n",
    "\n",
    "La idea es maximizar el número de suscriptores anuales con el fin de hacer crecer el negocio de renta de bicicletas. Después de limpiar, procesar y analizar los datos, hemos llegado a las siguientes conclusiones: \n",
    "\n",
    "1. Los suscriptores realizan un mayor número de viajes de corta duración mientras que los usuarios casuales suelen hacer viajes largos pero\n",
    "en menor cantidad. \n",
    "\n",
    "2. Esta diferencia se mantiene a lo largo de los meses y a lo largo de cada semana.\n",
    "\n",
    "3. Los suscriptores suelen usar más la bicicleta en la semana mientras que los usuarios casuales la usan más en los fines de semana.\n",
    "\n",
    "4. Los viajes de los suscriptores suelen tener la misma duración en promedio, mientras que los de los usuarios casuales fluctúa. \n",
    "\n",
    "\n",
    "# Gráficos extra\n",
    "En esta sección agregamos algunos gráficos que podrían ayudar a los interesados\n",
    "\n",
    "## El tipo de bicicleta que más usan los suscriptores y los usuarios casuales"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "dffe8707",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-02-18T18:19:34.021993Z",
     "iopub.status.busy": "2025-02-18T18:19:34.020765Z",
     "iopub.status.idle": "2025-02-18T18:19:34.639481Z",
     "shell.execute_reply": "2025-02-18T18:19:34.638224Z"
    },
    "papermill": {
     "duration": 0.636271,
     "end_time": "2025-02-18T18:19:34.641386",
     "exception": false,
     "start_time": "2025-02-18T18:19:34.005115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n5oI7OSoAAAAASUVORK5CYII="
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
    "total_trips_2024 %>% group_by(member_casual, rideable_type) %>%\n",
    "     summarise(number_of_rides = n()) %>% \n",
    "     arrange(member_casual, rideable_type) %>% \n",
    "     ggplot(aes(x=rideable_type, y=number_of_rides, fill=member_casual)) + \n",
    "      geom_col(position=\"dodge\") + \n",
    "      labs(title = \"Bicletas más usadas\",\n",
    "           subtitle = \"Por tipo de usuario\",\n",
    "           x=\"Tipo de bicicleta\",\n",
    "           y=\"Número de viajes\",\n",
    "           fill=\"Tipo de usuario\",\n",
    "           caption = \"Datos recabados en 2024\") +\n",
    "      scale_y_continuous(breaks = seq(0, 2500000, 250000), labels = scales::comma)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7472471d",
   "metadata": {
    "papermill": {
     "duration": 0.013589,
     "end_time": "2025-02-18T18:19:34.669508",
     "exception": false,
     "start_time": "2025-02-18T18:19:34.655919",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 6468486,
     "sourceId": 10449985,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": false,
   "language": "r",
   "sourceType": "notebook"
  },
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
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 79.987422,
   "end_time": "2025-02-18T18:19:35.304720",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-02-18T18:18:15.317298",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
