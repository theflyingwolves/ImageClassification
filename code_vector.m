function  code_vector(inputFile, outputFile , classID, imgID) 
 
    load([inputFile,'/feature_descriptor/featureDescriptor_',num2str(classID),'_',num2str(imgID),'.mat'], 'featureDescriptor'); 
    load('training/code_book/CodeBook.mat','CodeBook');
    % In this function, we calculate the code vector.
    % We use a code vector to represent an image.
   
    
    %%%%%%%%%% TO Do  %%%%%%%%%%%%%
    % You may represent each image by the histogram of these indices over codebook or use "sparse code + pooling". 
    % Following example code just let you know the relationship between code vector and descriptors.
    % Please remove this example code and rewrite your code vector computing here. 
    
    % ===================== Vector Quantizaation ======================
    
    %curCodeVector = zeros(size(CodeBook,2),1);
    
    %currFeatureVector = zeros(size(featureDescriptor,1),1);
    %currCodeBookEntry = zeros(size(CodeBook,1),1);
    
    %for uu = 1 : length(featureDescriptor)
    %    currFeatureVector = featureDescriptor{uu};
    %    minSquaredDist = 0;
    %    minSquaredDistIndex = 0;
        
    %    for vv = 1:size(CodeBook,2)
    %        currCodeBookEntry = CodeBook(:,vv);
    %        diffVec = double(currFeatureVector) - double(currCodeBookEntry);
    %        squaredDist = diffVec' * diffVec;
    %        if minSquaredDist == 0
    %            minSquaredDist = squaredDist;
    %            minSquaredDistIndex = vv;
    %        elseif squaredDist < minSquaredDist
    %            minSquaredDist = squaredDist;
    %            minSquaredDistIndex = vv;
    %        end
    %    end
        
    %    curCodeVector(minSquaredDistIndex,1) = curCodeVector(minSquaredDistIndex,1) + 1;
    %end
    
    %codeVector = curCodeVector / (length(featureDescriptor));
    
    
    % ===================== Sparse Coding + Pooling ======================
    for uu = 1 : length(featureDescriptor)
        currFeatureVector = double(featureDescriptor{uu});
        codeVectorAll{uu} = CodeBook' * currFeatureVector;
    end
    
    %Mean Pooling
    sum = zeros(size(codeVectorAll{1},1),size(codeVectorAll{1},2));
    for vv = 1 : length(codeVectorAll)
        sum = sum + (codeVectorAll{vv} .^ 2);
    end
    codeVector = sqrt(sum / length(codeVectorAll));
    codeVector = codeVector / norm(codeVector);
    
    %curCodeVector = zeros(size(CodeBook,2),1);
    %for uu = 1 : length(featureDescriptor)
    %    curCodeVector  = curCodeVector  + abs(CodeBook'*featureDescriptor{uu}');
    %end
    %codeVector  =  curCodeVector/length(featureDescriptor); 
 
    %%%%%%%%%% To Do  End %%%%%%%%%%
    save([outputFile,'/code_vector/codeVector_',num2str(classID),'_',num2str(imgID),'.mat'], 'codeVector'); 

end