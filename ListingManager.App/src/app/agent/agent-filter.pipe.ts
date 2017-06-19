import { Pipe, PipeTransform } from '@angular/core';
import { IAgent } from './agent';

@Pipe({
  name: 'agentFilter'
})
export class AgentFilterPipe implements PipeTransform {

    transform(value: IAgent[], filterBy: string): IAgent[] {
        filterBy = filterBy ? filterBy.toLocaleLowerCase() : null;
        return filterBy ? value.filter((agent: IAgent) =>
            agent.AgentName.toLowerCase().indexOf(filterBy) !== -1) : value;
    }

}

