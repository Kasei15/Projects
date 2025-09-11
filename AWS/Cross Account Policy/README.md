## Cross_Account_policy
This Policy is to be attach to user as inline policy  in order to be able to **put**,**delete** objects in the specified S3 bucket from another AWS account.

## SID Allow KMS Key Access
This part in the policy allows the user to use the Customer managed Key found in the cross account to decrypt and encrypt data, for this specific policy *lets assume that the Bucket uses a CMK to encrypt data and the KMS key is found in the account where the bucket is found*

## Bucket Poliy
The buket policy allows the user from another account to put and delete objects in the bucket.

## Key Policy
The key policy is added to the CMK on the account where the bucket is found so that the user is allowed to generate a data key that will be used to encrypt/decrypt data on AWS