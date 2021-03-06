library(shiny)
library(igraph)
library(visNetwork)
library(highcharter)
library(shinyBS)

shinyUI(
  navbarPage(
    "",
    tabPanel(
      "Welcome",
      fluidPage(
        
      )
    ),
    tabPanel(
      "People Directory",
      fluidPage(
        
      )
    ),
    tabPanel(
      "Department Directory",
      fluidPage(
        
        tags$head(
          tags$script(
            '
            Shiny.addCustomMessageHandler("scrollDown",
            function(color) {
            var y = $(window).scrollTop();  //your current y position on the page
            $(window).scrollTop(y+200);
            }
            );'
    )
          ),
    wellPanel("with stuff in it"),
    uiOutput("department_app_title"),
    uiOutput("department_app_description"),
    bsCollapse(
      id = "collapseExample",
      open = NULL,
      bsCollapsePanel(HTML(
        paste0(
          '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>',
          " Deparment Overview (click to expand)"
        )
      ),
      fluidPage(
        uiOutput("department_app_collapsile_info")
      ), style = "primary")
    ),
    tabsetPanel(
      tabPanel("People Directory",
               uiOutput("people_directory_UI")),
      tabPanel(
        "Department Collaboration Network",
        fluidPage(
          fluidRow(
            column(
              selectInput(
                "people_or_departments",
                "Show?",
                choices = c("within department", "within whole network")
              ),
              uiOutput("department_network_edge_degree_UI"),
              width = 4
            ),
            column(visNetworkOutput("department_network"),
                   width = 8)
          ),
          highchartOutput("highchart_node_legened", height = "150px")
        )
      )
    )
    # wellPanel(
    #   DT::dataTableOutput("selected_node_table")
    # )
    
      )
    ),
    tabPanel(
      "Network",
      fluidPage(
        
      )
    )
    
  , collapsible = TRUE))