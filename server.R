#
# Function to assess Cardiac Risk from BP readings
#
# Below is the table implemented
#
#                     Systolic      Diastolic
#Hypotension          < 90           < 60
#Normal  			        90 - 120	 &   60  -  80
#Prehypertension			120 - 139  or  80  -  89
#High BP Stage 1			140 - 159  or  90  -  99
#High BP Stage 2			160 - 180  or  100 - 110
#Hypertensive Crisis(Emergency care needed)	
#                     > 180	     or	> 110
#
cardiacRiskBP <- function(systolic, diastolic) {
  if ((systolic > 180) | (diastolic >= 110))
  { return("Hypertensive Crisis(Emergency care needed)")}
  else if ((systolic > 160) | (diastolic >= 100))
  { return("High BP Stage 2") }
  else if ((systolic > 140) | (diastolic >= 90))
  { return("High BP Stage 1") }
  else if ((systolic > 120) | (diastolic > 80))
  { return("Prehypertension") }
  else if ((systolic < 90) | (diastolic < 60))
  { return("Hypotension") }
  else 
  { return("Normal") }
}
#
# Function to assess Cardiac Risk fro Triglyceride/HDL-C ratio
#
# Here is the table implemented
#
# Normal              < 2
# High Rsik           < 4
# Very High Risk      < 6
# Very Very High Risk > 6
#
cardiacRiskTGHDL <- function(tg,HDL) {
  if (tg/HDL  <= 2 ) 
    {return("Normal")}
  else if (tg/HDL <= 4 )
    {return("High Risk!")}
  else if (tg/HDL <= 6 )
    {return("Very High Risk!!")}
  else 
    {return("Very Very High Risk!!!")}
}

shinyServer(
  function(input, output) {
    output$bpRisk <- renderPrint({cardiacRiskBP(input$systolic,input$diastolic)})
    output$tgRisk <- renderPrint({cardiacRiskTGHDL(input$tg, input$HDL)})
  }
)