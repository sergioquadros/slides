data(iris)

library(ggplot2)
library(devtools)
library(slidify)
library(slidifyLibraries)
library(shiny)
library(shinyapps)

output$main_plot <- renderPlot({
                if(input$plotType=="Scatter Plot"){
                        p1 <- ggplot(data=iris,aes(x=iris[,input$x_var],y=iris[,input$y_var]))+
                                geom_point(aes(colour=Species),alpha=0.95,size=3,na.rm=TRUE)+
                                xlab(paste(input$x_var," (cm)"))+
                                ylab(paste(input$y_var," (cm)"))

                }else{
                        p1 <- ggplot(data=iris,aes(x=iris[,input$x_hist],y=..count..,
                                             label=..count..),stat="count",
                               position="dodge")+
                                geom_histogram(aes(colour=Species,fill=Species),
                                               bins=input$bins,alpha=0.95,
                                               position="dodge")+
                                xlab(paste(input$x_hist," (cm)"))
                }
        p1$set(dom="main_plot",width=400)
        p1
        })
