require(mxnet)

# read from files residing in the package
extdata <- system.file("extdata", package = "rDeepThought")
train <- read.csv(paste(extdata, "train_digits.csv", sep = "/"), header=TRUE)
test  <- read.csv(paste(extdata, "test_digits.csv", sep = "/"), header=TRUE)

# [1] 42000   785
# [1] 28000   784


train <- data.matrix(train)
test <- data.matrix(test)

train.x <- train[,-1]
train.y <- train[,1]

dim(train)
dim(test)

# normalization
train.x <- t(train.x/255)
test <- t(test/255)

dim(train.x)
dim(test)


table(train.y)

# LeNet
# input
data <- mx.symbol.Variable('data')
# first conv
conv1 <- mx.symbol.Convolution(data=data, kernel=c(5,5), num_filter=20)
tanh1 <- mx.symbol.Activation(data=conv1, act_type="tanh")
pool1 <- mx.symbol.Pooling(data=tanh1, pool_type="max",
                           kernel=c(2,2), stride=c(2,2))
# second conv
conv2 <- mx.symbol.Convolution(data=pool1, kernel=c(5,5), num_filter=50)
tanh2 <- mx.symbol.Activation(data=conv2, act_type="tanh")
pool2 <- mx.symbol.Pooling(data=tanh2, pool_type="max",
                           kernel=c(2,2), stride=c(2,2))
# first fullc
flatten <- mx.symbol.Flatten(data=pool2)
fc1 <- mx.symbol.FullyConnected(data=flatten, num_hidden=500)
tanh3 <- mx.symbol.Activation(data=fc1, act_type="tanh")
# second fullc
fc2 <- mx.symbol.FullyConnected(data=tanh3, num_hidden=10)
# loss
lenet <- mx.symbol.SoftmaxOutput(data=fc2)


# reshape
train.array <- train.x
dim(train.array) <- c(28, 28, 1, ncol(train.x))
test.array <- test
dim(test.array) <- c(28, 28, 1, ncol(test))


n.gpu <- 1
device.cpu <- mx.cpu()
device.gpu <- lapply(0:(n.gpu-1), function(i) {
    mx.gpu(i)
})


# GPU
mx.set.seed(0)
tic <- proc.time()
model <- mx.model.FeedForward.create(lenet, X = train.array, y = train.y,
                                     ctx = device.gpu, num.round = 5,
                                     array.batch.size = 100,
                                     learning.rate = 0.05, momentum = 0.9,
                                     wd = 0.00001,
                                     eval.metric = mx.metric.accuracy,
                                     batch.end.callback = mx.callback.log.train.metric(100))
print(proc.time() - tic)
#  user  system elapsed
# 17.23   69.32   41.19
