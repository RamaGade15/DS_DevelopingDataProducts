shinyUI(fluidPage(
    titlePanel("Cardiovascular Health Assessment"),
    sidebarLayout(
    # Application title
    sidebarPanel(
      h4("Enter below your BP reading, Triglicerides, HDL-C from lipid panel to assess your cardiovascular health."),
      h4("Results will be shown on the right side ->"),
      numericInput('systolic', 'Systolic Blood Pressure', 120, min = 50, max = 200, step = 1),
      numericInput('diastolic', 'Diastolic Blood Pressure', 80, min = 50, max = 200, step = 1),
      sliderInput('tg', 'Triglyceride', value = 100, min = 50, max = 500, step = 1),
      sliderInput('HDL', 'HDL-C Cholesterol', value = 50, min = 10, max = 200, step = 1)
#     submitButton('Submit')
    ),

    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Assessment",            
          h3('Your Cardiac Risk from BP'),
          verbatimTextOutput("bpRisk"),      
          #     
          h3('Your Cardiac Risk from Triglycerides and HDL-C'),
          verbatimTextOutput("tgRisk")         
        ),
        tabPanel("Tips",
          h4('Tips to Improve Cardiovascular health -'),
          h5('* Exercise regularly.'),
          h5('* Lose extra pounds and watch waistline.'),    
          h5('* Reduce sodium in diet.'),
          h5('* Reduce saturated fat, trans fat & carbohydrates in diet.'),
          h5('* Eat food with omega-3s.'),
          h5('* Cut back on caffeine.'),
          h5('* Quit smoking.'),
          h5('* Limit alcohol consumption.'),
          h5('* Manage stress levels.')
        ),
        tabPanel("Help",
          h4("This application helps self assessment of Cardiovascualr risk."),
          br(),
          p("Select the 'Assessment' tab and enter your blood pressure readings, Triglyceride level and HDL-C level."),
          p("Result will be shown immediately."),
          p("To improve your cardiovascular health refer to tips."),
          p("Finally, after understanding risk levels you can use the slider to get an idea of target levels to reduce risk.")
        )
      )
    )
  )
))
