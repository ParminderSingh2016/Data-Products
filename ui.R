library(datasets)
library(shiny)

shinyUI(fluidPage(
  titlePanel("Calculate Burned Calories"),
  sidebarPanel(
    p(strong("Enter your details below:")),
    numericInput(inputId="weight", label="Weight (pounds)", value= 0,min=0),
    p("# 1 Pound = 0.45 Kilo"),
    radioButtons(inputId="gender", label="Gender", choices=c("Female","Male")),
    numericInput(inputId="age", label="Age", value= 0,min=0),
    numericInput(inputId="height", label="Height (inch)", value= 0, min=0),
    p("# 1 Feet = 12 Inches"),
    selectInput(inputId="activity", label="Activity Level", choices=c("Sedentary (little or no exercise)",
                                                                       "Lightly Active (light exercise/sports 1-3 days/week)",
                                                                       "Moderately Active (moderate exercise/sports 3-5 days/week)",
                                                                       "Very Active (hard exercise/sports 6-7 days a week)",
                                                                       "Extra Active (very hard exercise/sports & physical job or 2x training)"),selected = NULL, multiple = FALSE),
    actionButton("goButton", "Submit"),
    br(),
    p("After submitting, view the Results in Your Results Tab")
),
  mainPanel(
tabsetPanel(
    tabPanel('General',
             h3('General Details for You'),
  p("Source: ", a("Exercise Vs Calories Burned", 
                  href = "https://www.teachengineering.org/collection/nyu_/activities/nyu_bungee/nyu_bungee_activity1_figure2web.jpg")),
  img(src="activity1.jpg", height = 220, width =400),
  br(),
  img(src="Caloriesburned.png", height = 500, width =500)
  ),

    tabPanel('Your Results',
            h5('Your Basal Metabolic Rate (BMR)'),
            verbatimTextOutput("BMR"),
             h5('Calories Burned by you:'),
             verbatimTextOutput("AM")
  )
  
))
))