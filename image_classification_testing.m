function classificationRes = image_classification_testing()
% to run this code, the first thing you need to do, is to put all the
% testing images into one folder named "1"(that contains 40*5 images in all.)

    disp('code_vector computing begins......')

    kk = 0;
    for classID = 1 : 5
        for imgID = 61 : 100
            disp(['code vector: the ',num2str(imgID),' th image is processing'])
            feature_extraction('testing', 'testing', classID, imgID);
            code_vector('testing', 'testing', classID, imgID);
            kk = kk + 1;
            groundTruth(kk) = classID;
        end
    end
    save('accuracy/groundTruth.mat','groundTruth');
    
    classificationRes = testing();
    save('accuracy/classificationRes.mat', 'classificationRes');

    disp('testing phase is done!')
end

function  classificationRes = testing()
  
    % Choise 1: if you use kNN, you may need all codebook in learning step
    % "codeVectorAll" and its classID "classIDs"
    
    load([ 'training/code_vector/codeVector_',num2str(1),'_',num2str(1),'.mat'], 'codeVector');
    codeVectorAll = zeros(size(codeVector,1),200);
    classIDs = zeros(1,200);
    kk = 0;
    for classID = 1 : 5
        for imgID = 1 : 40
            load([ 'training/code_vector/codeVector_',num2str(classID),'_',num2str(imgID),'.mat'], 'codeVector');
            kk = kk + 1;
            codeVectorAll(:,kk) = codeVector;
            classIDs(kk) = classID;
        end
    end
     
    % Choice 2: if you use SVM, you may need all normal vector w, please load it
    load('training/SVM/w','w');
    load('training/SVM/b','b');
  
    classificationRes = zeros(1,200);
    kk = 0;
    for classID = 1:5
        for imgID = 61 : 100
            kk = kk + 1;
            load(['testing/code_vector/codeVector_',num2str(classID),'_',num2str(imgID),'.mat'], 'codeVector');
            classificationRes(kk) = img_classifiction(codeVector,codeVectorAll,classIDs,w,b);
        end
    end

end