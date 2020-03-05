pragma solidity ^0.5.10;
import "../RankedList.sol";


contract RankedListMock is RankedList{

    function addHead(uint256 _rank, address _data)
        public
    {
        return super._addHead(_rank, _data);
    }

    function addTail(uint256 _rank, address _data)
        public
    {
        return super._addTail(_rank, _data);
    }

    function insertAfter(uint256 _prevId, uint256 _rank, address _data)
        public
    {
        return super._insertAfter(_prevId, _rank, _data);
    }

    function insertBefore(uint256 _nextId, uint256 _rank, address _data)
        public
    {
        return super._insertBefore(_nextId, _rank, _data);
    }

    function _setHead(uint256 _id)
        internal
    {
        head = _id;
        emit NewHead(_id);
    }

    function _setTail(uint256 _id)
        internal
    {
        tail = _id;
        emit NewTail(_id);
    }

    function _createObject(uint256 _rank, address _data)
        internal
        returns (uint256)
    {
        uint256 newId = idCounter;
        idCounter += 1;
        Object memory object = Object(
            newId,
            0,
            0,
            _rank,
            _data
        );
        objects[object.id] = object;
        emit ObjectCreated(
            object.id,
            object.rank,
            object.data
        );
        return object.id;
    }

    function _link(uint256 _prevId, uint256 _nextId)
        internal
    {
        if (_prevId != 0 && _nextId != 0) {
            objects[_prevId].next = _nextId;
            objects[_nextId].prev = _prevId;
            emit ObjectsLinked(_prevId, _nextId);
        }
    }
}
