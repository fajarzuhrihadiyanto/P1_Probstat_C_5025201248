# PRAKTIKUM PROBSTAT

- Nama : Fajar Zuhri Hadiyanto
- NRP : 5025201248
- Kelas : Probstat C 2022

## Nomor 1
### persiapan
Pertama, import library yang diperlukan
```r
library(dplyr)
library(ggplot2)
```
### 1.a
Pada soal 1.a diminta P(X=3) dengan p = 0.2
```r
p <- 0.2
x <- 3

P_X <- dgeom(x, prob = p)
print(P_X)
```
Maka didapat hasilnya yaitu ```1.024```

![1.a](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/1.a.png)

### 1.b
set seed agar randomnya selalu sama
```r
set.seed(0)
```
Lalu set n-nya menjadi 10000
```r
n <- 10000
```
Generate 10000 data random dengan distribusi geometrik dan peluang 0.2
```r
data <- rgeom(n, prob = p)
```

Hitung rerata dari kemunculan data random == 3, lalu tampilkan hasilnya
```r
sim_P_X <- mean(data == 3)
print(sim_P_X)
```

Maka didapat hasil sebagai berikut

![1.b](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/1.b.png)

### 1.c

Dari soal 1.a didapatkan bahwa P(X=3) dengan distribusi geometrik dan peluang 0.2 yaitu ```0.1024```.
Dari soal 1.b didapatkan bahwa rerata kemunculan angka 3 pada 10000 bialngan random dengan distribusi geometrik dan peluang 0.2 yaitu ```0.1001```.

Dari situ, dapat disimpulkan bahwa P(X=x) distribusi geometrik dengan peluang p dapat diestimasi dengan
menghitung rerata kemunculan angka x pada serangkaian bilangan random berdistribusi geometrik dengan peluang p.

Atau dapat disimpulkan bahwa rerata kemunculan angka x pada serangkaian bilangan random berdistribusi geometrik dengan peluang p,
dapat dihitung dengan funsgi probabilitas distribusi geometrik.

### 1.d
```r
X <- 3
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
mutate(Failures = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge( 0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 3 Failures Prior to First Success",
     subtitle = "Geometric(0.2)",
     x = "Failures prior to first success (x)",
     y = "Probability")
```
Didapat grafik histogram sebagai berikut

![1.d](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/1.d.png)

### 1.e
Nilai rataan distribusi geometrik dapat dihitung dengan rumus ```(1-p)/p```
```r
data_mean <- (1-p)/p
print(data_mean)
```
Maka didapat hasil sebagai berikut

![1.e1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/1.e1.png)

Sedangkan nilai varian distribusi geometrik dapat dihitung dengan menggunakan rumus ```(1-p)/p^2```
```r
data_variance <- (1 - p)/p^2
print(data_variance)
```
Maka didapat hasil sebagai berikut

![1.e2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/1.e2.png)

## Nomor 2

### persiapan
Pertama, import library yang diperlukan
```r
library(dplyr)
library(ggplot2)
```

Lalu, tulis apa saja yang diketahui dari soal, yaitu banyak data dan peluang sukses
```r
n <- 20
p <- 0.2
```

### 2.a
Pada soal 2.a, diminta P(X=4) dengan distribusi binomial dan peluang 0.2
```r
x <- 4
P_X <- dbinom(x, n, p)
print(P_X)
```
Maka didapat hasil sebagai berikut

![2.a](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/2.a.png)

### 2.b
```r
x <- 0:n
X <- 4
y <- dbinom(x=x, size=n, prob=p)
data.frame(x = x, prob = y) %>%
mutate(Patient = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill=Patient)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge(0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 4 Patient recover",
     subtitle = "Binomial (0.2)",
     x = "Number of patient recover (x)",
     y = "Probability")
```
Maka didapat hasil sebagai berikut

![2.b](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/2.b.png)

### 2.c
Nilai rataan distribusi binomial dapat dihitung dengan rumus ```n * p```
```r
data_mean <- n*p
print(data_mean)
```
Maka didapat hasil sebagai berikut

![2.c1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/2.c1.png)

Sedangkan nilai varian distribusi binomial dapat dihitung menggunakan rumus ```n * p * (1-p)```
```r
data_variance <- n*p*(1-p)
print(data_variance)
```
Maka didapat hasil sebagai berikut

![2.c2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/2.c2.png)

## Nomor 3

### persiapan
Pertama, import library yang diperlukan
```r
library(dplyr)
library(ggplot2)
```

Lalu, tulis apa saja yang diketahui dari soal, yaitu nilai lambda
```r
lambda <- 4.5
```

### 3.a
Ditanya peluang kelahiran 6 bayi besok
```r
x <- 6
p_x <- dpois(x, lambda)
print(p_x)
```
Maka didapat hasil sebagai berikut

![3.a](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/3.a.png)

### 3.b
set seed agar randomnya selalu sama
```r
set.seed(0)
```

Generate data dengan distribusi poisson dengan banyaknya yaitu 365
```r
data <- rpois(365, lambda)
```

Hitung rerata kemunculan angka 6 pada deretan angka tersebut, lalu tampilkan hasilnya
```r
sim_p_x <- mean(data == 6)
print(sim_p_x)
```
Maka didapat hasil sebagai berikut

![3.b1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/3.b1.png)


```r
x <- 1:15
X <- 6
y <- dpois(x, lambda)
data.frame(x = x, prob = y) %>%
mutate(Birth = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill=Birth)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge(0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 6 Baby birth",
     subtitle = "Poisson (lambda = 4.5)",
     x = "Number of Birth",
     y = "Probability")
```
Dan berikut merupakan histogramnya

![3.b2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/3.b2.png)

### 3.c
Dari soal 3.a didapatkan bahwa peluang kelahiran 6 bayi yaitu ```0.1281201```.
Dari soal 3.b didapatkan bahwa peluang kemunculan angka 6 pada sederet bilangan dengan distribusi poisson dengan lambda 4.5 yaitu ```0.1232877```

Dari situ, dapat disimpulkan bahwa peluang terjadinya x kejadian dari rata-rata terjadinya lambda kali, dapat diestimasi dengan
menghitung peluang kemunculan angka x pada sederet bilangan berdistribusi poisson dengan nilai lambda tersebut.

Atau dapat disimpulkan bahwa peluang kemunculan angka x pada serangkaian bilangan random berdistribusi poisson dengan lambda tertentu
dapat dihitung dengan fungsi probabilitas distribusi poisson.

### 3.d
Nilai rataan distribusi poisson sama dengan nilai lambda
```r
data_mean <- lambda
print(data_mean)
```
Maka didapat hasil sebagai berikut

![3.d1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/3.d1.png)

Sedangkan nilai varian distribusi poisson sama dengan nilai lambda
```r
data_variance <- lambda
print(data_variance)
```
Maka didapat hasil sebagai berikut

![3.d2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/3.d2.png)

## Nomor 4

### Persiapan
Tulis apa saja yang diketahui dari soal, yaitu x dan v
```r
x <- 2
v <- 10
```

### 4.a
Pada soal 4.a diminta P(X=2) distribusi chi-square dengan v = 10
```r
P_X <- dchisq(x, v)
print(P_X)
```
Maka hasilnya yaitu sebagai berikut

![4.a](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/4.a.png)

### 4.b
Set seed agar randomnya selalu sama
```r
set.seed(0)
```

Generate 100 data random berdistribusi chi-square dengan v = 10
```r
x <- 1:100
y <- rchisq(x, 10)
```

Lalu buat histogramnya, yaitu sebagai berikut
```r
hist(y)
```

![4.b](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/4.b.png)


### 4.c
Nilai rataan pada distribusi chi-square sama dengan nilai v-nya
```r
data_mean <- v
print(data_mean)
```
Maka hasilnya yaitu sebagai berikut

![4.c1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/4.c1.png)

Sedangkan nilai varian pada distribusi chi-square yaitu ```2 * v```
```r
data_variance <- 2*v
print(data_variance)
```
Maka hasilnya yaitu sebagai berikut

![4.c2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/4.c2.png)

## Nomor 5

### 5.a
Diketahui suatu data random berdistribusi exponensial untuk lambda 3
```r
lambda <- 3
set.seed(1)
x <- rexp(1, rate = lambda)
```

Ditanya fungsi probabilitas distribusi exponensial untuk lambda 3
```r
P_X <- dexp(x, rate = lambda)
print(P_X)
```
Maka hasilnya yaitu sebagai berikut

![5.a](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.a.png)

### 5.b
Untuk 10 bilangan random
```r
set.seed(1)
hist(rexp(10, rate=lambda))
```
Maka histogramnya yaitu sebagai berikut

![5.b1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.b1.png)

Untuk 100 bilangan random
```r
set.seed(1)
hist(rexp(100, rate=lambda))
```
Maka histogramnya yaitu sebagai berikut

![5.b2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.b2.png)

Untuk 1000 bilangan random
```r
set.seed(1)
hist(rexp(1000, rate=lambda))
```
Maka histogramnya yaitu sebagai berikut

![5.b3](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.b3.png)

Untuk 10000 bilangan random
```r
set.seed(1)
hist(rexp(10000, rate=lambda))
```
Maka histogramnya yaitu sebagai berikut

![5.b4](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.b4.png)

### 5.c

Nilai rataan pada distribusi exponensial yaitu ```1/lambda```
```r
data_mean <- 1/lambda
print(data_mean)
```
Maka hasilnya yaitu sebagai berikut

![5.c1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.c1.png)

Sedangkan nilai varian pada distribusi exponensial yaitu ```1/(lambda^2)```
```r
data_variance <- 1/(lambda^2)
print(data_variance)
```
Maka hasilnya yaitu sebagai berikut

![5.c2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/5.c2.png)

## Nomor 6

### Persiapan
Dengan mean = 50 dan standar deviasi = 8
```r
d_mean <- 50
d_sd <- 8
```

Generate 100 data random berdistribusi normal
```r
set.seed(1)
n <- 100
data <- rnorm(n, mean = d_mean, sd = d_sd)
```

### 6.a
Hitung mean dan standar deviasi untuk data yang telah digenerate
```r
data_mean <- mean(data)
data_sd <- sd(data)
```

Hitung nilai X1 dan X2 seperti pada soal
```r
x1 <- floor(data_mean)
x2 <- ceiling(data_mean)
```

Hitung P(x1 <= x <= x2) dengan rumus dibawah
```r
P_X <- pnorm(x2, mean = data_mean, sd = data_sd, lower.tail = TRUE) -
  pnorm(x1, mean = data_mean, sd = data_sd, lower.tail = TRUE)
print(P_X)
```
Maka hasilnya yaitu seperti berikut

![6.a1](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/6.a1.png)

Hitung z-score dengan rumus ```z_score = (xi - mean) / sd```
```r
z_score <- (data - data_mean) / data_sd
print(z_score)
```
Maka hasilnya yaitu sebagai berikut

![6.a2](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/6.a2.png)

Untuk grafiknya yaitu sebagai berikut
```r
plot(data, dnorm(data, d_mean, d_sd))
```

![6.a3](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/6.a3.png)


### 6.b
Hitogram distribusi normal dengan breaks 50 yaitu sebagai berikut
```r
hist(data, breaks=50)
```

![6.b](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/6.b.png)


### 6.c
Nilai varian dari data hasil generate dapat dihitung sebagai berikut
```r
data_variance <- var(data)
print(data_variance)
```
Maka hasilnya yaitu

![6.c](https://probstat.s3.ap-southeast-1.amazonaws.com/praktikum-1/6.c.png)