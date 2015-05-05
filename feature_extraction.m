function feature_extraction(inputFile, outputFile, classID, imgID)
    
    % In this function, we read a training images and extract
    % feature on it. All those features is recorded in struct array 'featureDescriptor'. 
    % Each cell of 'featureDescriptor' is a vector which is the extracted
    % feature descriptor itself.
    Img = im2double(imread([inputFile,'/images/',num2str(classID),'/image',MyNum2str(imgID,4),'.jpg']));
           
    %%%%%%%%%% TO Do  %%%%%%%%%%%%%
    % You are required extract the features patch in image 'Im'
    % To make requirement clearly, we just give you an example of random extraction, it is a baseline method.
    % Please remove those example code and rewrite your more power extraction code here. 
    % You can use spatial pyramid matching, which can improve your preformance
    % significantly.
    [n,m,cch] = size(Img);
    if (ndims(Img) == 3)
        Img = rgb2gray(Img); % this is standard color to gray. 
    end
    
    
    [f,d] = vl_sift(single(Img));
    
    %sumOfDescs = zeros(size(d,1),1);
    
    %for ii = 1 : size(d,2)
    %    currDCol = d(:,ii);
    %    sumOfDescs = sumOfDescs + double(currDCol.^2);
    %end
    
    %pooledFeature = sqrt(sumOfDescs / size(d,2));
    
    %featureDescriptor{1} = pooledFeature;
    
    extractNum = 10;
    perm = randperm(size(f,2));
    sel = perm(1:extractNum);
    for kk = 1 : extractNum
        featureDescriptor{kk} = d(:,sel(kk));
    end
    
    %kk = 0;
    %extractNum = 10;  %
    %for iter = 1 : extractNum
    %     kk = kk + 1;        
    %     xs  = min(max(round(rand(1)*(n-16)),1),n-15); % patch size is 16 x 16, you can chose another patch size
    %     ys =  min(max(round(rand(1)*(m-16)),1),m-15);
    %     patch = Img(xs : xs+15 , ys : ys+15);     % record the patch feature.
         
        % The example code employ "hist", which is not an feature descriptor. It
        % just let you know how to obtain "featureDescriptor" in matlab platform.
        % Please remove this example code and rewrite your feather descriptor computing here.
   %     [f,d] = vl_sift(single(patch));
   %     featureDescriptor{kk} = d;
        
        %featureDescriptor{kk} = hist(patch(:),64); 
   % end
    
    %%%%%%%%%% To Do  End %%%%%%%%%%
    
    save([outputFile,'/feature_descriptor/featureDescriptor_',num2str(classID),'_',num2str(imgID),'.mat'], 'featureDescriptor');
    
end