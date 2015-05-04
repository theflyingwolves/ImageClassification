function descriptorMatrix = descriptpor_load()
    descriptorMatrix = [];
    kk = 0;
    for classID = 1 : 5
        for imgID = 1 : 60
            load(['training/feature_descriptor/featureDescriptor_',num2str(classID),'_',num2str(imgID),'.mat'], 'featureDescriptor');
            for ii = 1 : length(featureDescriptor)
                for jj = 1 : size(featureDescriptor{ii},2)
                    kk = kk + 1;
                    descriptorMatrix(:,kk) = featureDescriptor{ii}(:,jj)';
                end
            end
        end
    end
end