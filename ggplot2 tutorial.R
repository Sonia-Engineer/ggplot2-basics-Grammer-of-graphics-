#=================================================================
# ggplot BASIC SYNTAX.
#=================================================================

#These graphics are produced using the inbuilt mt cars data set

View(mpg)

#1. ggplot(data =Name of Dataset)+geom_type of plot (mapping = aes(subset of data))
  #Example :
ggplot(data = mpg)+geom_bar(mapping = aes(cty)) # To produce a graph of city milage

#2. ggplot(data =Name of Dataset)+geom_type of plot(mapping = aes(subset1,subset2))
  #Example 2.1:
ggplot(data = mpg)+geom_point(mapping = aes(class,drv)) # class is plotted on x-axis and drv on y
  #Example 2.2:
ggplot(data = mpg)+geom_point(mapping = aes(class,drv))+theme_bw() #theme_bw is theme there are different themes

#3. ggplot(data =Name of Dataset) + geom_point(mapping = aes(x = SubDataset1, y = SubDataset2, color = SubDataset3))
  #Example 2.3:
ggplot(data = mpg)+geom_point(mapping = aes(x = displ, y = hwy, color = class))
  #Example 2.4:
ggplot(data = mpg)+geom_point(mapping = aes(x = displ, y = hwy, alpha = class)) #alpha is replaced by color
  #Example 2.5:
ggplot(data = mpg)+geom_point(mapping = aes(x = displ, y = hwy, shape = class)) #Shape

#IMPORTANT NOTE : If color is mapped to a continous varriable it creates a gradient of legend.
  #Example:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cty))

#4.FACETS
  #ggplot(data = Name of Dataset)+geom_point(mapping = aes(x=SubDataset1, y=SubDataset2)) +
  #facet_wrap(~ Subdataset3, nrow = No.of rows)
  #Example 4.1:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)
  #Example 4.2:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~ cyl)

# Note: If you prefer to not facet in the rows or columns dimension, use a . instead of a variable name, e.g. + facet_grid(. ~ cyl).

#To generate facet row wise:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~ .)

#To generate facet column wise:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(.~ drv)

#To generate a smooth line curve.
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#To generate a colored line curve graph:
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),show.legend = FALSE)

#To display multiple geoms:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x =displ, y = hwy))

#Multiple representation of similar data:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point(mapping = aes(color = class)) +geom_smooth()

#To create a histogram of diamonds
ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut))

#======================================================================
# TO CREATE ALL POSSIBLE PLOT COMBINATION OF A DATASET
#======================================================================
install.packages("GGally")
library(GGally)
ggpairs(iris, aes(colour = Species, alpha = 0.4))
#the example is from iris data set.

#To get an onion skin effect ,alpha effect (gradients)
ggplot(diamonds,aes(x=cut,fill=clarity))+geom_bar(alpha=1/5,position = "identity")

#To get colored outline graphs:
ggplot(diamonds,aes(x=cut,colour=clarity))+geom_bar(fill = NA, position = "identity")

#To fill the positions in the bar graph
ggplot(diamonds) +geom_bar(aes(x = cut, fill = clarity), position = "fill")

# Multiple bargraphs for different parameters
ggplot(diamonds)+geom_bar(aes(x =cut,fill = clarity), position = "dodge")

# To turn a boxplot from x axis to y axis use the following :
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot() +coord_flip()#coord_flip() changes the orientation of the graph


#___________________________________________________________________________
#  Geometric objects
#___________________________________________________________________________
#To create a line graph
ggplot(mpg) +geom_smooth(aes(x = displ, y = hwy, linetype = drv))

#To create a line curve of Hwy vs displ
ggplot(mpg,aes(x=displ,y=hwy))+geom_smooth()+theme_bw()

#To create a line curve of varios drive type.
ggplot(mpg,aes(x=displ,y=hwy,linetype=drv))+geom_smooth()

data() #list of data sets available in R to practice.
#________________________________________________________
#           USING IRIS DATA SET TO PRACTICE 
#________________________________________________________
#Incorporation size ,color and alpha(opacity)
ggplot(iris,aes(x=Petal.Length,y=Sepal.Width,col= Species,size=Petal.Width))+geom_point()+labs(x="Petal Length",y="Sepal Width",title="Petal vs Sepal")

# Plotings with respect to summary and mean and stroke of color
ggplot(iris,aes(Species,Sepal.Length,col = Species))+geom_bar(stat = "summary",fun.y="mean")

#In case we want to fill the bars we need to use fill
ggplot(iris,aes(Species,Sepal.Length,fill = Species))+geom_bar(stat = "summary",fun.y="mean")

#To display changes in an attribute like for a bar (not vairaible from the data set)
#We must make changes in the geom, for example:
ggplot(iris,aes(Species,Sepal.Length))+geom_bar(stat = "summary",fun.y="mean",fill = "blue")

#To Provide a specific color to the bars and to stroke the outlines of the bars
ggplot(iris,aes(Species,Sepal.Length))+geom_bar(stat = "summary",fun.y="mean",fill = "#26A9A7",col="black")

#To control the shape if the plot further with jitter points:
myplot = ggplot(iris,aes(Species,Sepal.Length))+geom_bar(stat = "summary",fun.y="mean",fill = "#26A9A7",col="black")+geom_point(position= position_jitter(0.2),size=3,shape="*")
# The above graph is also stored as myplot

#Further modification of the plot needs
#only the myplot to be recalled and modified.

#Modifying the theme
myplot+theme(panel.grid = element_blank())
#panel.grid=element_blank() ??? removes the grid

#Adding x and y axis seperatly:
myplot+
  +   theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.line.y=element_line(colour = "black",size=0.2),,axis.line.x=element_line(colour = "black",size=0.2))
#To create a box around the plot:
myplot+
  +   theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),panel.border = element_rect(colour = "black",fill =NA,size=0.2))

#To modify the background on a pre-selected plot:
myplot+theme_linedraw()+theme(panel.background = element_rect(fill="#c9f7e0"))

#To adjust the title in the center:
myplot+theme_linedraw()+theme(panel.background = element_rect(fill="#c9f7e0"))+labs(y="Sepal Length(mm)")+ggtitle("Sepal length by iris species")+
  + theme(plot.title = element_text(hjust = 0.5)) #remove the addition + before executing.

# TO SAVE OUR PLOT:_______________________
ggsave("Graph1.jpeg",width = 8,height = 5)
#_________________________________________

#___________________________TO CREATE A LINE GRAPH______________________________________________________________
data(ToothGrowth)
head(ToothGrowth)
View(ToothGrowth)
#To generate a line graph.
ggplot(ToothGrowth,aes(as.factor(dose), len, group =supp, col=supp)) + geom_line(stat = "summary", fun.y ="mean")

