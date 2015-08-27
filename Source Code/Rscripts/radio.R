require(tcltk2)
tt <- tktoplevel()
tkwm.title(tt,"Social Network Mining")
rb1 <- tkradiobutton(tt)
rb2 <- tkradiobutton(tt)
rb3 <- tkradiobutton(tt)
rb4 <- tkradiobutton(tt)
rb5 <- tkradiobutton(tt)
rb6 <- tkradiobutton(tt)

rbValue <- tclVar("1")
tkconfigure(rb1,variable=rbValue,value="1")
tkconfigure(rb2,variable=rbValue,value="2")
tkconfigure(rb3,variable=rbValue,value="3")
tkconfigure(rb4,variable=rbValue,value="4")
tkconfigure(rb5,variable=rbValue,value="5")
tkconfigure(rb6,variable=rbValue,value="6")

fontHeading <- tkfont.create(family="times",size=24,weight="bold")
fontTitle <- tkfont.create(family="times",size=24,weight="bold")
fontTextLabel <- tkfont.create(size=16)
fontFixedWidth <- tkfont.create(family="courier",size=12)

tkgrid(tklabel(tt,text="           Select your choice " ,font=fontHeading))
tkgrid(tklabel(tt,text="Search term in tweets"),rb1)
tkgrid(tklabel(tt,text="Display tweets of particular user"),rb2)
tkgrid(tklabel(tt,text="Top trends of this hour "),rb3)
tkgrid(tklabel(tt,text="Views on given term (by emotion)"),rb4)
tkgrid(tklabel(tt,text="Views on given term (by polarity)"),rb5)
tkgrid(tklabel(tt,text="Comparison of tweets of two person "),rb6)

OnOK <- function()
{
    rbVal <- as.character(tclvalue(rbValue))
    tkdestroy(tt)
    if (rbVal=="1")
    	source('getTerms.R', echo=TRUE)

    if (rbVal=="2")
    	source('getTweetsOfUser.R', echo=TRUE)

    if (rbVal=="3")
    	source('getTrends.R', echo=TRUE)

    if (rbVal=="4")
    	source('Sentiment_Analysis.R', echo=TRUE)

    if (rbVal=="5")
    	source('S_A_By_Polarity.R', echo=TRUE)

    if (rbVal=="6")
    	source('compare_tweets.R', echo=TRUE)

}
OK.but <- tkbutton(tt,text="OK",command=OnOK)
tkgrid(OK.but)
