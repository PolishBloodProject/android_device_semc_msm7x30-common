#
# Accelerometers
#
ifeq ($(SENSORS_ACCEL_BMA150_INPUT),yes)
DASH_SENSORS += bma150_input.c
DASH_SENSORS_CFLAGS += -DACC_BMA150_INPUT
endif

ifeq ($(SENSORS_ACCEL_BMA250_INPUT),yes)
DASH_SENSORS += bma250_input.c
DASH_SENSORS_CFLAGS += -DACC_BMA250_INPUT
endif

ifeq ($(SENSORS_ACCEL_BMA250NA_INPUT),yes)
DASH_SENSORS += bma250na_input.c
DASH_SENSORS += wrappers/bma250na_input_accelerometer.c
DASH_SENSORS_CFLAGS += -DACC_BMA250_INPUT
endif

ifeq ($(SENSORS_COMPASS_LSM303DLH),yes)
DASH_SENSORS_CFLAGS += -DST_LSM303DLH
DASH_ST_LSM303DLHX_ENABLE = yes
endif

ifeq ($(SENSORS_COMPASS_LSM303DLHC),yes)
DASH_SENSORS_CFLAGS += -DST_LSM303DLHC
DASH_ST_LSM303DLHX_ENABLE = yes
endif

ifeq ($(DASH_ST_LSM303DLHX_ENABLE),yes)
DASH_SENSORS += sensor_xyz.c
DASH_SENSORS += lsm303dlhx_acc.c
DASH_SENSORS += wrappers/lsm303dlhx_accelerometer.c
endif

#
# Compasses
#
ifeq ($(SENSORS_COMPASS_AK8973),yes)
DASH_SENSORS_CFLAGS += -DAK8973
DASH_SENSORS_CFLAGS += -DAKM_CHIP_NAME=\"AK8973\"
DASH_SENSORS_CFLAGS += -DAKM_CHIP_MAXRANGE=2000
DASH_SENSORS_CFLAGS += -DAKM_CHIP_RESOLUSION=100
DASH_SENSORS_CFLAGS += -DAKM_CHIP_POWER=0.8
SENSORS_COMPASS_AK897X=yes
endif

ifeq ($(SENSORS_COMPASS_AK8975),yes)
SENSORS_COMPASS_AK897X=yes
DASH_SENSORS_CFLAGS += -DAK8975
DASH_SENSORS_CFLAGS += -DAKM_CHIP_NAME=\"AK8975\"
DASH_SENSORS_CFLAGS += -DAKM_CHIP_MAXRANGE=2000
DASH_SENSORS_CFLAGS += -DAKM_CHIP_RESOLUSION=100
DASH_SENSORS_CFLAGS += -DAKM_CHIP_POWER=0.8
endif

ifeq ($(SENSORS_COMPASS_AK897X),yes)
DASH_SENSORS += ak897x.c
endif

#
# Light sensors
#

#
# Proximity sensors
#
ifeq ($(SENSORS_PROXIMITY_APDS9700),yes)
DASH_SENSORS += apds970x.c
PROXIMITY_SENSOR_NAME = "APDS9700 Proximity"
DASH_SENSORS_CFLAGS += -DPROXIMITY_SENSOR_NAME=\"$(PROXIMITY_SENSOR_NAME)\"
endif

ifeq ($(SENSORS_PROXIMITY_APDS9702),yes)
DASH_SENSORS += apds970x.c
PROXIMITY_SENSOR_NAME = "APDS9702 Proximity"
DASH_SENSORS_CFLAGS += -DPROXIMITY_SENSOR_NAME=\"$(PROXIMITY_SENSOR_NAME)\"
endif

ifeq ($(SENSORS_PROXIMITY_SHARP_GP2),yes)
DASH_SENSORS += sharp_gp2.c
endif

ifeq ($(SENSORS_PROXIMITY_NOA3402),yes)
DASH_SENSORS += noa3402.c
DASH_SENSORS_CFLAGS += -DPROXIMITY_PATH=\"$(SENSORS_PROXIMITY_NOA3402_PATH)\"
endif

ifeq ($(SENSORS_PROXIMITY_TLS2772),yes)
DASH_SENSORS += tsl2772.c
endif

#
# Pressure sensors
#
ifeq ($(SENSORS_PRESSURE_BMP180),yes)
DASH_SENSORS += bmp180_input.c
endif

ifeq ($(SENSORS_PRESSURE_LPS331AP),yes)
DASH_SENSORS += lps331ap_input.c
endif

#
# Gyro sensors
#

ifeq ($(SENSORS_GYRO_L3G4200D),yes)
ifneq ($(DASH_ST_LSM303DLHX_ENABLE),yes)
DASH_SENSORS += sensor_xyz.c
endif
DASH_SENSORS += l3g4200d_gyro.c
DASH_SENSORS += wrappers/l3g4200d_gyroscope.c
DASH_SENSORS_CFLAGS += -DGYRO_L3G4200D_INPUT
endif

#
# Wrapper sensors
#

#
# LinearAcceleration, RotationVector, Gravity
#
