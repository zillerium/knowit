pragma solidity ^0.5.1;

 
contract Knowit  {
 
 // medical video training system
 // the contract should record the hash address of the video
 // record also the creator of the video 
 // and who had approved it 
 // the video distribution is also approved ie via schools or community workers
 
    struct creatorRecord {
        string creatorName;
        string hashCertificate;
        bool exists;
    }
 
    struct video {
       string keyword;
       string creatorRecord;
       bool exists;
       uint videoId; // temp fix due to string and bytes46 in ipfs - need to build proper index 
                     // for addresses of videos in ipfs and an Id on the blockcgain.
    }
    
   // mapping(bytes32 => video) public videos; // hash of video in ipfs is the mapping
    mapping(address => creatorRecord) public creatorRecords;// address is the wallet address of the video creator
  
    video[] public videos;
    
    uint public currentVideo;
    
    function addVideo(string memory keyword,
                       address creatorAddress,
                       string memory videoAddress // ipfs hash of video
    ) public {
        uint myvideo = currentVideo++;
       require (creatorRecords[creatorAddress].exists);  
   //     require (currentVideo!=0 && !videos[myvideo].exists);  
        currentVideo++;
   //     video memory aVideo;
//        aVideo.keyword = keyword;
  //      aVideo.creatorRecord=creatorRecords[creatorAddress].hashCertificate;//
//        aVideo.videoId = myvideo;
  //      aVideo.exists = true;
  string memory creatorId = creatorRecords[creatorAddress].hashCertificate;
  
   video memory aVideo = video(keyword, creatorId, true, myvideo);   
    videos.push(aVideo);
  
 
 
        
    }
    
    // sample wallet - 0x95fDb223FE47B91adCeaF3f69895C8A77a4435B3
    
    // QmefWxay2L9L59oNnt8Xg86PfB9URoDBcFS86HRNFf2Ew7 example certificate of a 
    // doctor's degree 
    // https://ipfs.io/ipfs/QmefWxay2L9L59oNnt8Xg86PfB9URoDBcFS86HRNFf2Ew7 
    
    function addVideoCreator(address creatorAddress,
                       string memory creatorName,
                       string memory hashCertificate
    ) public {
        require (!creatorRecords[creatorAddress].exists);
        creatorRecords[creatorAddress].creatorName=creatorName;
        creatorRecords[creatorAddress].hashCertificate=hashCertificate;
        creatorRecords[creatorAddress].exists=true;
    }
    
    function getVideoCreatorId(address creatorAddress) view public returns (string memory) {
        require (creatorRecords[creatorAddress].exists);
        return creatorRecords[creatorAddress].hashCertificate;
    }
    
    
        
    
  
}

   
