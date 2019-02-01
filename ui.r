library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    
    dashboardHeader(title="This is the header",
                    
          dropdownMenu(
            type = "message",
            messageItem(from = "Finance Update",message="We Are On Threshold"),
            messageItem(from = "Sales Update",message="Sales we are at 55%",icon=icon("bar-chart"), time="22:00"),
            messageItem(from = "Sales Update",message="Sales Meeting",icon=icon("handshake-o"), time="01-31-2019")
            ),
          
          dropdownMenu(
            type = "notifications",
            notificationItem(text = "Two new tabs added to the dasboard",icon=icon("dashboard"),status="success"),
            notificationItem(text = "Server is running at its full cpacity",icon=icon("warning"),status="warning")
            
          ),
          dropdownMenu(
            type = "tasks",
            taskItem(value = 80, color="aqua","Dashboard Learning"),
            taskItem(value = 55, color="red","Overall Education")
            
          )

                    
                    ),
    
    
    
    dashboardSidebar(

      sidebarMenu(
        sidebarSearchForm("searchText","buttonSearch",label="Search"),
      menuItem("Dashboard",tabName="dashboard", icon= icon("dashboard")),
        menuSubItem("Dashboard Finance",tabName="finance"),
        menuSubItem("Dashboard Sales",tabName="sales"),
      menuItem("Detailed Analysis",badgeLabel = "Coming Soon",badgeColor = "blue"),
      menuItem("Raw Data",badgeLabel = "Coming Soon",badgeColor = "blue")

      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  box(title="Histogram of Faithful",status = "primary",solidHeader = TRUE,background = "aqua",plotOutput("histogram")),
                  box(title = "Controls for Dashboard", status = "warning", solidHeader = T,
                      "Use these controls to fine tune your dashboard",br(),"Do not use alot of contorls",
                      sliderInput("bins","Number of Breaks",1,100,50),
                      textInput("text_input","Search Oppurtunities",value="123456")
                      
                      )
                  )),
      tabItem(tabName = "finance",
              h1("Finance Dashboard")
              ),
      
      tabItem(tabName = "sales",
              h1("Sales Dashboard")
      )
    
      
      
    )
    
  )
  
)
)
