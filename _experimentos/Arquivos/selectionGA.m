function parents = selectionGA(expectation,nParents,options)

[~,loc]=ismember(min(expectation),expectation);
parentTemp = loc;

parents = selectionuniform(expectation,nParents-1,options);
parents = [parents parentTemp];
