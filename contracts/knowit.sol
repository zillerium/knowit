pragma solidity ^0.5.1;

 
contract Knowit  {
 
 // medical video training system
 // the contract should record the hash address of the video
 // record also the creator of the video 
 // and who had approved it 
 // the video distribution is also approved ie via schools or community workers
 
    struct creatorRecord {
        string creatorName;
        bytes32 hashCertificate;
        bool exists;
    }
 
    struct video {
       string keyword;
       bytes32 creatorRecord;
       bool exists;
    }
    
    mapping(bytes32 => video) public videos; // hash of video in ipfs is the mapping
    mapping(address => creatorRecord) public creatorRecords;// address is the wallet address of the video creator
 
    video[] videocats;
    
    function addVideo(string memory keyword,
                       address creatorAddress,
                       bytes32 videoAddress // ipfs hash of video
    ) public {
        require (creatorRecord[creatorAddress].exists);  
        require (!video[videoAddress].exists);    
        videos[videoAddress].keyword=keyword;
        videos[videoAddress].creatorRecord= creatorRecord[creatorAddress].hashCertificate;
        videos.push(videoAddress);
        
    }
    
    // QmefWxay2L9L59oNnt8Xg86PfB9URoDBcFS86HRNFf2Ew7 example certificate of a 
    // doctor's degree 
    // https://ipfs.io/ipfs/QmefWxay2L9L59oNnt8Xg86PfB9URoDBcFS86HRNFf2Ew7 
    
    function addVideoCreator(address creatorAddress,
                       string memory creatorName,
                       bytes32 certHashAddress
    ) public {
        require (!creatorRecord[creatorAddress].exists);
        creatorRecord[creatorAddress].creatorName=creatorName;
        creatorRecord[creatorAddress].hashCertificate=hashCertificate;
        creatorRecord[creatorAddress].exists=true;
    }
    
    function getVideoCreatorId(address creatorAddress) view public returns (bytes32) {
        require (creatorRecord[creatorAddress].exists);
        return creatorRecord[creatorAddress].hashCertificate;
    }
    
    
        
    
  
}

   
