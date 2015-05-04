function accuracy_cal()
    load('accuracy\classificationRes.mat','classificationRes');
    load('accuracy\groundTruth.mat','groundTruth');
    rate = sum(double(classificationRes==groundTruth))/200;
    disp(['Your accuracy rate is ',num2str(rate*100), ' %' ]);
end