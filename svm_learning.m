function  svm_learning()

    disp('svm learning begins......')     
    %%%%%%%%%% TO Do  %%%%%%%%%%%%%
    % if you use SVM as classifier. please computing the normal vector "w". Please
    % remove following code, and rewrite your code.
    w = zeros(500,5);
    b = zeros(5,1);
    
    codeVectorMatrix = zeros(500,300);
    
    for classID = 1 : 5
        for imageID = 1 : 60
            load(['training/code_vector/codeVector_',num2str(classID),'_',num2str(imageID),'.mat'],'codeVector');
            codeVectorMatrix(:,((classID-1)*60+imageID)) = codeVector;
        end
    end
    
    lambda = 0.01;
    maxIter = 1000;
    
    for classID = 1 : 5
        labels = -ones(1,300);
        
        for imageID = 1 : 60
            labels(1,((classID-1)*60+imageID)) = 1;
        end
                
        [currW currB info] = vl_svmtrain(codeVectorMatrix,labels,lambda,'MaxNumIterations',maxIter);
        
        disp('Size of currW: (Expected 500-by-1):');
        size(currW)
        
        w(:,classID) = currW';
        b(classID,1) = currB;
    end
    
    %%%%%%%%%% To Do  End %%%%%%%%%%
    save('training/SVM/w.mat','w')
    save('training/SVM/b.mat','b')
end