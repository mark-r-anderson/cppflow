TF_DIR := $(shell echo $(TF_DIR))
TF_LIBRARY_PATH := $(TF_DIR)/lib
TF_INCLUDE_PATH := $(TF_DIR)/include
TF_LIBRARY := tensorflow

CPPFLOW_DIR :=$(shell echo $(PWD))
CPPFLOW_INCLUDE_PATH := $(CPPFLOW_DIR)/include
CPPFLOW_LIBRARY_PATH := $(CPPFLOW_DIR)/lib
CPPFLOW_LIB := cppflow

standard:
	g++ -Wall -std=c++11 -c -fPIC -I$(TF_INCLUDE_PATH) -I$(CPPFLOW_INCLUDE_PATH) -L$(TF_LIBRARY_PATH) $(CPPFLOW_DIR)/src/Tensor.cpp -o $(CPPFLOW_LIBRARY_PATH)/Tensor.o -l$(TF_LIBRARY)

	g++ -Wall -std=c++11 -c -fPIC -I$(TF_INCLUDE_PATH) -I$(CPPFLOW_INCLUDE_PATH) -L$(TF_LIBRARY_PATH) $(CPPFLOW_DIR)/src/Model.cpp -o $(CPPFLOW_LIBRARY_PATH)/Model.o -l$(TF_LIBRARY)

	g++ -Wall -std=c++11 -shared $(CPPFLOW_LIBRARY_PATH)/Tensor.o $(CPPFLOW_LIBRARY_PATH)/Model.o -o $(CPPFLOW_LIBRARY_PATH)/lib$(CPPFLOW_LIB).so

clean:
	rm -f $(CPPFLOW_LIBRARY_PATH)/Tensor.o $(CPPFLOW_LIBRARY_PATH)/Model.o $(CPPFLOW_LIBRARY_PATH)/lib$(CPPFLOW_LIB).so
