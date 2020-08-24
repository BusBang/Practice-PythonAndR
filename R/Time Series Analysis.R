##�ð迭�м�

##���� �ð迭

#���� - ���� �� 42���� ��� �� ����.
#��������� ��� �ð迭�ڷημ� Ʈ���� ���, �ұ�Ģ ��ҷ� ����
#20��° �ձ����� 38��~55���� ������ ����
#���� ���� ������ �þ 40��°���� 73������ ����

# 1) �ڷ� �б� �� �׷��� �׸���
library(tseries)
library(forecast)
library(TTR)
king <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip3)
king.ts <- ts(king)
plot.ts(king.ts)

# 2) 3�� ���� ����� ���� �׷����� �ε巴�� ǥ��
king.sma3 <- SMA(king.ts, n=3)
plot.ts(king.sma3)

# 3) 8�� ���� ����� ���� �׷����� �ε巴�� ǥ��
king.sma8 <- SMA(king.ts, n=8)
plot.ts(king.sma8)

##ARIMA �� - ���� �ð迭�� ���� ����Ѵ�.
#1) �ڷ� �б� �� �׷��� �׸���
king.ff1 <- diff(king.ts, differences=1)
plot.ts(king.ff1)

# 2) ACF�� PACF�� ���� ������ ARIMA �� ����
# 2-1 ACF
acf(king.ff1, lag.max=20)
acf(king.ff1, lag.max=20, plot=FALSE)

## ACF���� lag 1�� ���� ������ ��� ���� ���� �ȿ� �ְ�, �������� ���� �ȿ� �ִ�

# 2-2 PACF
pacf(king.ff1, lag.max=20)
pacf(king.ff1, lag.max=20, plot=FALSE)

## PACF���� lag 1, 2, 3���� ���� ������ �ʰ��ϰ� ���� ���� ������ �������� lag 4�̴�.

# 3) ������ ARIMA���� ã��
auto.arima(king)

#���� ���� ��� ���� �������� ������ ARIMA������ ARIMA(0,1,1) �̴�

# 4) ����
king.arima <- arima(king, order=c(0, 1, 1))
king.forecasts <- forecast(king.arima)
king.forecasts

## 42���� ������ �߿��� ������ ���� ����� ���̴� 56��
## 43��°���� 52��° �ձ��� 10���� ���� ����� ���̸� ������ ��� 67.75��� ������.
## �ŷ� ������ 80%~95%����