#include "storepersist.h"
#include "rawfilestorepersist.h"
#include "keychainstorepersist.h"

using namespace EverDo;

StorePersist* StorePersist::createStore(StoreType type) {
    switch (type) {
        case RawFileStore:
            return new RawFileStorePersist();
        case KeychainStore:
            return new KeychainStorePersist();
    }

    throw std::runtime_error("Bad store type");
}
