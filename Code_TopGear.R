###1.x <- c(2,7,1,-17,NA,Inf,35,21)

x <- c(2,7,1,-17,NA,Inf,35,21)
##use Rank function in R with NAs as last
rank(x,na.last = TRUE)

##use Rank function in R with NAs as first
rank(x,na.last = FALSE)

###2. What does below function do?
rowSums(iris[,-5])
##rowSums function adds all the values present in each rows separately 

###3. What does below function do?
colSums(iris[,-5])
##colSums function adds all the values present in each columns separately 

###4. what does below piece of code do?
z = c("may", "the", "rain", "shower")
substring(z, 2, 3) <- c("@", "#")
## Substring function will extract or replace the substrings in a character vector 
## First 2 letters of all the elements in the character vector z is replaced with the values {c("@","#")} successively since the start value in substring is given as 2 
## letters more than 3 will not be displayed since the last value in substring is given as 3 
## So the output of this code will be: "@y","#e","@i","#o"

###5. what does below function do?
v1 <- c(2,5,6,3,7)
v2 <- c(15,16,7,3,2,7,5)
match(v1,v2)
##match returns a vector of the positions of first matches of its first argument(v1) in its second (v2).
## If no match is found then NA will be returned. In this case 2 (v1) is found in 5th position of 2nd argument(v2) so 5 will be returned
## Output of this would be 5 7 NA 4 3

###6.sort mtcars by mpg column and sort mtcars by carb  and then by cyl

library(data.table)
data.table(mtcars)
mpg1<-mtcars[order(mtcars$mpg),]
carb1<-mtcars[order(mpg1$carb),]
finalData <- mtcars[order(carb1$cyl),]

###7. use identical functions and check if below vectors are equal
a <- c(1,2,4,5)
b <- c(1,5,4,2)
identical(a,b)

###8.Create a function that given one word, return the position of word's letters on letters vector.
##For example, if the word is 'abc', the function will return 1 2 3.
fun <- function(x){
  match(unlist(strsplit(x, split="")), letters)
}

fun("acd")

###9.Create a function that given a numeric vector X returns the digits 0 to 9 that are not in X. If X=0 2 4 8 
##the function return 1 3 5 6 7 9

num <- function(y){
  x<-setdiff(0:9,y)
  return(x)
}
num(c(1,3,5,7))

###10. Create a function that given a numeric vector, sort this in ascending order and duplicate it by two.

dup <- function(AS){
  AS1<-sort(AS,decreasing = FALSE)
  final<-rep(AS1,each=2)
  return (final)
}
dup(c(3,5,6,2,8,91))

###11. Consider a data frame df:

Id=c(1:10)
Age=c(14,12,15,10,23,21,41,56,78,12)
Sex=c('F','M','M','F','M','F','M','M','F','M')
Code=letters[1:10]
df=data.frame(Id,Age,Sex,Code)

###Create a function that, given a data frame and two indexes, exchanges two values ??of the Code variable with each other.
###For example, if the index is 1 and 3, you assign:
swap <- function(x1,x3){
  df1<-paste(df[x1,'Id'])
  df[x1,'Id']<-paste(df[x3,'Id'])
  df[x3,'Id']<-paste(df1)
  print(df[x3,'Id'])
  print(df[x1,'Id'])
}
swap(1,3)

###12.Consider a vector:
  
x<-c('NAME:Maria /COUNTRY:uruguay /EMAIL:mariaUY@gmail.com','NAME:Paul/COUNTRY:UK /EMAIL:PaulUK@gmail.com',
       'NAME:Jhon /COUNTRY:USA /EMAIL:JhonUSA@gmail.com','NAME:Carlos /COUNTRY:Spain /EMAIL:CarlosSP@gmail.com')

##Create a function that given a vector string ST return a matrix:
mat <- function(ST){
  ST1<-gsub(":",",",ST)
  ST2<-gsub("/",",",ST1)
  ST3<-strsplit(ST2,split = ",",fixed = TRUE)
  s<-list(unique(unlist(ST3)))
  Names<-s[[1]][c(1,2,7,10,13)]
  Country<- s[[1]][c(3,4,8,11,14)]
  Email <- s[[1]][c(5,6,9,12,15)]
  m<-matrix(c(Names,Country,Email),nrow = 3,ncol = 5,byrow = TRUE)
  return(m)
}
mat(x)



