FROM rocker/shiny:latest
RUN install2.r rsconnect plotly dplyr ggpubr \
    lubridate dplyr ggplot2 shinyWidgets
WORKDIR /home/shinyusr
COPY ui.R ui.R
COPY server.R server.R
COPY outputs outputs
COPY deploy.R deploy.R
CMD Rscript deploy.R
