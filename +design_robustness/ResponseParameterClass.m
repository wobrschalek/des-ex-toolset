classdef ResponseParameterClass
    % ResponseParameterClass   Class for storing information about a particular ResponseParameter
    % 
    %
    % ResponseParameterClass Properties:
    %         modelelementname - name of the element of the model from which the noise factor is generated
    %         currentvalue - current value of the response parameter
    %         mean - meanvalue of the response parameter
    %         csmaddress - numeric vector representing the response parameter address in the model tree
    %         collectionmatrix - array containing all collected values
    %         gradients - array of calculated gradients
    %         scaledgradients - array of scaled calculated gradients
    %         gradientmagnitude - combined gradient magnitude
    %
    % ResponseParameterClass Methods:
    %    ResponseParameterClass - Constructor of updategradients
    %    updategradients - calculates gradients of the system reponse
    %    scalegradients - calculates scaled gradients of the system reponse
    %    combinegradients - take magnitude of all gradients for each response parameter
    %    
   properties
        modelelementname {mustBeText} = "undefined" % modelelementname - name of the element of the model from which the noise factor is generated
        currentvalue% currentvalue - current value of the response parameter
        mean % meanvalue of the response parameter
        csmaddress % csmaddress - numeric vector representing the response parameter address in the model tree
        collectionmatrix % array containing all collected values
        gradients = [] % array of calculated gradients
        scaledgradients = [] % array of scaled calculated gradients
        gradientmagnitude  % combined 

        
   end
   methods
       function obj = ResponseParameterClass(name,currentvalue,address)
           %ResponseParameterClass is the constructor of the
           %ResponseParameterClass object
           % Inputs:
           %    name : name of the element of the model from which the design values is generated
           %    currentvalue : current value of response
           %    parameter
           %    address : address of the element in the model
           % Outputs:
           %    obj : the ResponseParameterClass object
            if nargin == 3
                obj.modelelementname = name;
                obj.currentvalue = currentvalue;
                obj.csmaddress = address;
                obj.mean = currentvalue;
                

            end
       end
       function obj = updategradients(obj,value,noisefactor)
           %updategradients calculates gradients of the system reponse
           %parameter wrt. each identified noise factor
           % Inputs:
           %    value : perturbed value of noise factor
           %    noisefactor : relevant noise factor object

             

           obj.gradients(end+1) = (value-obj.mean)/(noisefactor.currentvalue-noisefactor.mean);       
       end
       function obj = scalegradients(obj,noisefactormean,noisefactorid)
           %scalegradients calculates scaled gradients of the system reponse
           %parameter wrt. each identified noise factor
           % Inputs:
           %    noisefactormean : relevant noise factor mean
           %    noisefactorid : relevant noise factor id

             

           obj.scaledgradients(end+1) = noisefactormean / obj.mean * obj.gradients(noisefactorid);       
       end
       function obj = combinegradients(obj)
            %combinegradients take magnitude of all gradients for each response parameter
            mag = 0;
            for i = 1:size(obj.scaledgradients,2)
                mag = mag + obj.scaledgradients(i)^2;
            end
            obj.gradientmagnitude = mag^0.5;
       end
   end
end