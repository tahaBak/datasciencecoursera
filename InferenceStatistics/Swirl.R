library(swirl)
install_from_swirl("Statistical Inference")


swirl()

## To display : image(matrix) --> gives an image of the matrix
## decomposition svd  u d vt
## d -> variance expliquee
## u explique les lignes
## v explique les colonnes
## singular components are the Columns of V
## singular Values are elements of the diagonal d
## d gives  singular values(weight of variance)in decreasing order 

## matrix multiplication : %*%

## la commande table permet de visualizer des informations sur les donnees discretes

## on peut utiliser la svd pour compresser les donnees (exemple de l'image ^^)

## To study rows ---> we use U left singular Matrix

## To study columns --> we use V right singular Matrix

## extracting columns except 2 latest : sub1[, -c(562, 563)

##| You can exit swirl and return to the R prompt (>) at any time by pressing
##| the Esc key. If you are already at the prompt, type bye() to exit and save
##| your progress. When you exit properly, you'll see a short message letting
##| you know you've done so.

##| When you are at the R prompt (>):
##  | -- Typing skip() allows you to skip the current question.
##| -- Typing play() lets you experiment with R on your own; swirl will ignore
##| what you do...
##| -- UNTIL you type nxt() which will regain swirl's attention.
##| -- Typing bye() causes swirl to exit. Your progress will be saved.
##| -- Typing main() returns you to swirl's main menu.
##| -- Typing info() displays these options again.

## solution instead of increasing n : Agresti/Coull interval

## la fonction make.names

##mean(is.na(x0)) permet de voir le pourcentage des missing values
# after plot , we call points() to "add" points to the existing plot
nbPlace<-1304287*28

memory<- (nbPlace * 8) / (1024^2) 

memory

#la fonction tapply

##$B$18

##$B$18:$D$18

binom.test(12,15,p=0.5)

1-pbinom(11,15,0.5)



