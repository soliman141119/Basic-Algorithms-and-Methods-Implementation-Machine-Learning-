data= load('optdigits_train.txt');
test = load('optdigits_test.txt');
num_principal_components = 2;
[principal_components,eigenvalues] = myPCA(data,num_principal_components);
train_data = data(:,1:size(data,2)-1);
test_data = test(:,1:size(test,2)-1);
test_data_label = test(:,size(test,2));
train_data_label = data(:,size(data,2));
projected_train_data = train_data * principal_components;
projected_test_data = test_data * principal_components;
projected_test_data = [projected_test_data,test_data_label];
projected_train_data = [projected_train_data,train_data_label];
Xdatapoint = [projected_train_data(:,1);projected_train_data(:,1)];
Ydatapoint = [projected_train_data(:,2);projected_train_data(:,2)];
value = [projected_train_data(:,3);projected_train_data(:,3)];
r = [1:250];
figure;
gscatter(Xdatapoint,Ydatapoint,value);
text(Xdatapoint(r,:),Ydatapoint(r,:),num2str(value(r,:)));
